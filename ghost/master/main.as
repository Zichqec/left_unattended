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
	
	//There must be a better way to get what I want but I'm tired and don't feel like it right now, so just copying from Hoard of Shinies
	TalkBuilder.Default.AutoLineBreak = "\n\w8\w4";
	
	LastTalk = "";
	
	PartyClutter = {};
	VisibleChars = {};
	LastItemSpawn = Time.GetNowUnixEpoch();
	
	//This one is the other way around so we can have a little randomness to it...
	NextGuestSpawn = Time.GetNowUnixEpoch() + GuestSpawnTime();
	NextVIPSpawn = Time.GetNowUnixEpoch() + VIPSpawnTime();
	ResetCooldown();
	
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
	if (IsDebugMode && Save.Data.SpawningEnabled == 0) return;
	
	local epoch = Time.GetNowUnixEpoch();
	if (CanTalk() && epoch - CooldownTime >= 10) //I could use reference3 instead of CanTalk, but...
	{
		local since = epoch - LastItemSpawn;
		local nextitem = LastItemSpawn + ItemSpawnTime();
		
		local output = "";
		
		if (epoch >= nextitem)
		{
			LastItemSpawn = epoch;
			ResetCooldown();
			output = OnSpawnItem();
		}
		
		else if (CanSpawnGuest())
		{
			if (epoch >= NextGuestSpawn)
			{
				NextGuestSpawn = epoch + GuestSpawnTime();
				ResetCooldown();
				output = OnSpawnGuest();
			}
		}
		
		else if (TooManyGuests())
		{
			//Debug.WriteLine("SHIORI headers status: {Shiori.Headers.Status.ToString()}");
			ResetCooldown();
			return OnDespawnGuest(); //Exception, this one returns right away because it opens a new balloon. Maybe change? hmm
		}
		
		else if (CanSpawnVIP())
		{
			if (epoch >= NextVIPSpawn)
			{
				NextVIPSpawn = epoch + VIPSpawnTime();
				ResetCooldown();
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

//TODO there's a little issue here where if an item spawns during a dialogue her face will reset at the end...
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
	return clutter.SurfaceRestore();
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
	ResetCooldown();
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

function quitbutton@caption
{
	return "Leave";
}

function closebutton@caption
{
	return "Ask her to leave";
}

function homeurl
{
	return "https://raw.githubusercontent.com/Zichqec/left_unattended/refs/heads/main/";
}

function ghostver
{
	return "1.0.0";
}

function FormatLinks(links)
{
	local output = "";
	for (i = 0; i < links.length; i++)
	{
		//Name then 0x01, URL then 0x02
		output += links[i].name + (1).ToAscii();
		output += links[i].url + (2).ToAscii();
	}
	return output;
}

function sakura@recommendsites
{
	return FormatLinks([
		{name: "Zi's Ukagaka Space", url: "https://ukagaka.zichqec.com/"},
		{name: "Galla's Ghosts", url: "https://gallathegalla.github.io/gtg-ghosts/"},
		{name: "Aosora SHIORI", url: "https://github.com/kanadelab/aosora-shiori"},
	]);
}