//——————————————— OnTranslate ———————————————
function OnTranslate
{
	local talkstr = Shiori.Reference[0];
	
	talkstr = AutoPause(talkstr);
	
	return talkstr;
}

function AutoPause(talkstr)
{
	if (!(talkstr.Contains("\![no-autopause]") || talkstr.Contains("■Aosora reload completed")))
	{
		talkstr = talkstr.Replace(", ",",\w4 ");
		talkstr = talkstr.Replace(". ",".\w8\w8 ");
		talkstr = talkstr.Replace("~ ","~\w8\w8 ");
		talkstr = talkstr.Replace("? ","?\w8\w8 ");
		talkstr = talkstr.Replace("! ","!\w8\w8 ");
		talkstr = talkstr.Replace("; ",";\w8 ");
		talkstr = talkstr.Replace(": ",":\w8 ");
		talkstr = talkstr.Replace("\n\n ","\n\n\w8\w8");
	}
	return talkstr;
}


//——————————————— Save data ———————————————
//Default save data
function OnAosoraDefaultSaveData
{
	Save.Data.TalkInterval = 180;
	Save.Data.Username = "friend";
	Save.Data.VIPsAllowed = 0;
	
	Save.Data.SpawningEnabled = 1; //DEBUG because i'm dying trying to develop this thing lol
}

//Values to be set upon loading
function OnAosoraLoad
{
	TalkTimer.RandomTalk = OnSendTalk;
	TalkTimer.RandomTalkIntervalSeconds = Save.Data.TalkInterval;
	//TalkTimer.NadenadeTalk = OnStroked; //TODO I don't know how to determine which character...
	
	//There must be a better way to get what I want but I'm tired and don't feel like it right now, so just copying from Hoard of Shinies
	TalkBuilder.Default.AutoLineBreak = "\n\w8\w4";
	
	LastTalk = "";
	
	PartyClutter = {};
	VisibleChars = {};
	LastItemSpawn = Time.GetNowUnixEpoch();
	
	//This one is the other way around so we can have a little randomness to it...
	NextGuestSpawn = Time.GetNowUnixEpoch() + GuestSpawnTime();
	NextVIPSpawn = Time.GetNowUnixEpoch() + VIPSpawnTime();
	CooldownTime = Time.GetNowUnixEpoch();
	
	//As in monitor...
	Display = {};
	LastWidth = 0;
	LastHeight = 0;
	
	Stroke = 0;
	
	IsDebugMode = 0;
}

function OnInitialize
{
	//I want it to initialize some of them for me on reloading, but I can't do that without it not knowing what coords to put them at... do I care? hm
	//It seems like it places them at the coordinates where they were last...? in which case, shrug. Debug annoyance but whatever...
	if (Shiori.Reference[0] == "reload")
	{
		InitializeItem(3);
	}
}


//——————————————— Randomtalk control ———————————————
//Call coming from menu, hotkey, or \a
function OnAITalk
{
	LastTalk = TalkTimer.CallRandomTalk();
	return LastTalk;
}

//Call coming from TalkTimer
function OnSendTalk
{
	LastTalk = Reflection.Get("RandomTalk")();
	return LastTalk;
}

function OnLastTalk
{
	return LastTalk;
}


//——————————————— Mouse control ———————————————
function OnMouseMove, OnMouseWheel
{
	local scope = Shiori.Reference[3];
	if (scope == 0) return;
	
	if (PartyClutter[scope].type == "deco")
	{
		Stroke++;
		if (Stroke % 75 == 0)
		{
			return PartyClutter[scope].Pet();
		}
	}
}

function OnMouseLeave
{
	Stroke = 0;
}

function OnMouseDoubleClick
{
	if (Shiori.Reference[5] == 0)
	{
		if (Shiori.Reference[3] == 0) return OnMainMenu();
		else
		{
			local index = Shiori.Reference[3];
			
			return PartyClutter["{index}"].Menu;
		}
	}
}


//——————————————— Boot and close control ———————————————
function OnBoot
{
	InitializeItem(3);
	
	local holiday = TodaysHoliday();
	
	if (!holiday.IsNull()) return SurfaceRefresh() + BootHolidayTalk(holiday);
	else return SurfaceRefresh() + BootTalk();
}

function OnCloseAll, OnGhostChanging
{
	return CloseDefeatTalk() + "\_w[1000]\-";
}

function OnClose
{
	if (DecoCount() == 0)
	{
		if (Random.GetIndex(0,3) == 0)
		{
			InitializeItem(3);
			//nouserbreakmode still allows you to double click her, but that refreshes the surfaces so it's probably fine...? but if i reconsider that behavior i should add more tags here
			return "\![enter,nouserbreakmode]" + CloseNotYetTalk() + "\![leave,nouserbreakmode]\e";
		}
		else return CloseCleanedUpTalk() + "\_w[1000]\-";
	}
	else return CloseStillPartyingTalk() + "\e";
}


//——————————————— Surface restore ———————————————
function OnSurfaceRestore, OnWindowStateRestore, SurfaceRefresh
{
	local output = "";
	local usedwindows = [];
	
	foreach (local thing in PartyClutter)
	{
		output += thing.SurfaceRestore();
		usedwindows.Add(thing.p);
	}
	
	foreach (local surface, p in VisibleChars)
	{
		local found = 0;
		foreach (local window in usedwindows)
		{
			if (window == p)
			{
				found = 1;
				break;
			}
		}
		if (!found) output += "\p[{p}]\s[-1]";
	}
	
	output += "\0\s[0]";
	return output;
}


//——————————————— Spawning/despawning logic ———————————————
function OnSecondChange
{
	if (Save.Data.SpawningEnabled == 0) return;
	
	local epoch = Time.GetNowUnixEpoch();
	if (CanTalk() && epoch - CooldownTime >= 10) //I could use reference3 instead of CanTalk, but...
	{
		local since = epoch - LastItemSpawn;
		local nextitem = LastItemSpawn + ItemSpawnTime();
		
		local output = "";
		
		if (epoch >= nextitem)
		{
			//TODO something to think about: this will trigger if you dismiss items and the time until next item goes down... might be a nuisance but oh well! the alternative seems worse? maybe add a cooldown variable...
			LastItemSpawn = epoch;
			CooldownTime = epoch; //TODO these cooldown things (that's what i should have called it lol) probably need to be moved so that if you manually dismiss stuff that also resets the cooldown
			output = OnSpawnItem();
		}
		
		else if (CanSpawnGuest())
		{
			if (epoch >= NextGuestSpawn)
			{
				NextGuestSpawn = epoch + GuestSpawnTime();
				CooldownTime = epoch;
				output = OnSpawnGuest();
			}
		}
		
		else if (TooManyGuests())
		{
			//Debug.WriteLine("SHIORI headers status: {Shiori.Headers.Status.ToString()}");
			CooldownTime = epoch;
			return OnDespawnGuest(); //Exception, this one returns right away because it opens a new balloon. Maybe change? hmm
		}
		
		else if (CanSpawnVIP())
		{
			if (epoch >= NextVIPSpawn)
			{
				NextVIPSpawn = epoch + VIPSpawnTime();
				CooldownTime = epoch;
				output = OnSpawnVIP();
			}
		}
		
		if (output != "")
		{
			if (BalloonIsOpen) output = "\C" + output;
			return output;
		}
	}
}


//————— deco —————
function OnSpawnItem
{
	InitializeItem(1);
	return OnSurfaceRestore();
}

function InitializeItem(num)
{
	if (num.IsNull()) num = 1;
	
	for (local i = 0; i < num; i++)
	{
		local clutter = new PartyDeco();
		PartyClutter.Add("{clutter.p}", clutter);
	}
}


//————— guests —————
function OnSpawnGuest
{
	local clutter = new PartyGuest();
	PartyClutter.Add("{clutter.p}", clutter);
	return OnSurfaceRestore();
}

function OnDespawnGuest
{
	local guestlist = [];
	foreach (thing in PartyClutter)
	{
		if (thing.type == "guest") guestlist.Add(thing.p);
	}
	local pick = Random.Select(guestlist);
	return PartyClutter[pick].Vanish();
}


//————— VIPs —————
function OnSpawnVIP
{
	return "\![call,ghost,random]";
}

function OnGhostCallComplete, OnOtherGhostBooted
{
	return VIPArriveTalk(Shiori.Reference[0],Shiori.Reference[2]);
}

function OnOtherGhostClosed
{
	CooldownTime = Time.GetNowUnixEpoch();
	return VIPLeaveTalk(Shiori.Reference[0],Shiori.Reference[2]);
}


//——————————————— Misc ———————————————
function OnAnchorSelect
{
	if (Shiori.Reference[0].StartsWith("http://") || Shiori.Reference[0].StartsWith("https://"))
	{
		return `\j["{Shiori.Reference[0]}"]`;
	}
}

function OnKeyPress
{
	if (Shiori.Reference[0] == "f1") return "\![open,readme]";
	else if (Shiori.Reference[0] == "t") return OnAITalk;
	else if (Shiori.Reference[0] == "r") return OnLastTalk;
	if (IsDebugMode)
	{
		if (Shiori.Reference[0] == "o") return "\![raise,OnSpawnItem]";
		else if (Shiori.Reference[0] == "g") return "\![raise,OnSpawnGuest]";
		else if (Shiori.Reference[0] == "c")
		{
			PartyClutter.Clear();
			return "\![raise,OnSurfaceRestore]";
		}
	}
}