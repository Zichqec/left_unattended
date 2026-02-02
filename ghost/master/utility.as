//——————————————— Flags/counts ———————————————
//————— Spawn time calcs —————
function ItemSpawnTime(test)
{
	local decocount = DecoCount();
	if (!test.IsNull()) decocount = test;
	if (decocount < 3) return 30;
	else
	{
		//OH GOD I'M SO BAD AT MATH WHAT AM I DOING
		
		//I would like to thank Balatro for guiding me towards the solution, truly this would not have been possible without your support
		local decomult = 1.15;
		local output = 30;
		for (local i = 0; i < decocount; i++)
		{
			output *= decomult;
		}
		return output.Floor();
	}
}

function GuestSpawnTime
{
	return Random.GetIndex(2,7) * 10; //20-60
}

function VIPSpawnTime
{
	return Random.GetIndex(9,19) * 10; //90-180
}


//————— Count things present —————
function CountPartyClutter(type)
{
	local count = 0;
	foreach (thing in PartyClutter)
	{
		if (thing.type == type) count++;
	}
	return count;
}

function DecoCount
{
	return CountPartyClutter("deco");
}

function GuestCount
{
	return CountPartyClutter("guest");
}

function VIPCount
{
	local count = 0;
	//llllllllisten. they don't count. they don't.
	//here i was wondering why the VIP mechanic wasn't working, and it turns out it's because i like music and water reminders
	//THEY DONT COUNT
	local excludedghosts = [
		"Hydrate",
		"FLELE",
		"FLUX",
		"Ukatranslator",
		"ancient-tablet",
		"translator",
	];
	
	foreach (ghost in OpenGhosts)
	{
		//This feels bad but I am drawing a blank on how to do it better???
		//What I want is ASEARCH, but i think i need an associative array to do that, but associative arrays need keys...
		local found = 0;
		for (local i = 0; i < excludedghosts.length; i++)
		{
			if (excludedghosts[i] == ghost) found = 1;
		}
		if (!found) count++;
	}
	return count;
}


//————— Check specific conditions —————
function TooManyGuests
{
	local decocount = DecoCount() - 3;
	
	if (GuestCount() > (decocount * 1.5).Floor() && GuestCount() > 0) return true;
	else return false;
}

function CanSpawnGuest
{
	local decocount = DecoCount();
	if (decocount > 3)
	{
		//1.5 guests for every deco (after the first 3)
		decocount -= 3;
		if (GuestCount() < (decocount * 1.5).Floor()) return true;
	}
	
	return false;
}

function CanSpawnVIP
{
	if (!Save.Data.VIPsAllowed) return 0;
	
	local guestcount = GuestCount();
	
	//3 VIPs per guest
	local maxvips = (guestcount / 3).Floor();
	
	local vipcount = VIPCount();
	
	//She counts as 1 installed ghost, so subtract one here
	if (vipcount < maxvips && OpenGhosts.length < (InstalledGhosts.length - 1)) return 1;
	else return 0;
}

function enable_debug
{
	IsDebugMode = Shiori.Reference[0].ToNumber();
}

function ManyGuests
{
	if (GuestCount() >= 10) return true;
	else return false;
}

function FewGuests
{
	if (GuestCount() >= 1 && !ManyGuests()) return true;
	else return false;
}


//——————————————— Shortcuts ———————————————
function username
{
	return Save.Data.Username;
}

function CanTalk
{
	if (Shiori["talking"] || Shiori["choosing"] || Shiori["minimizing"] || Shiori["timecritical"])
	{
		return 0;
	}
	else
	{
		return 1;
	}
}

//Will be 0 if the balloon is not open, and 1 if the balloon is open
//TODO it seems to be returning 1 even if the balloon is closed...? everything is using \C when spawning
//This is probably too much to dig into right at the moment... it isn't causing any obvious bugs, but i should follow up later
function BalloonIsOpen
{
	local shioristatus = Shiori.Headers.Status.ToString();
	
	if (shioristatus.Contains("balloon")) return 1;
	else return 0;
}

function TrimHolidayName(name)
{
	name = name.Replace("your ","");
	name = name.Replace("The ","");
	name = name.Replace(" Day","");
	name = name.Replace(" Night","");
	return name;
}

function narrator
{
	return "\f[italic,1]";
}

function narratoroff
{
	return "\f[italic,default]";
}

function ResetCooldown
{
	CooldownTime = Time.GetNowUnixEpoch();
}


//——————————————— Pure functions ———————————————
//Absolute
function abs(num)
{
	if (num < 0) return num *= -1;
	else return num;
}

function Capitalize(word)
{
	word = "{word}";
	local firstlet = word.Substring(0,1);
	local rest = word.Substring(1);
	
	return firstlet.ToUpper() + rest;
}


//——————————————— Notify info ———————————————
function OnDisplayChangeEx
{
	Display.Clear();
	local reference = Shiori.Reference;
	reference.Remove(0); //First reference is "init" or "update"
	foreach (local ref, i in reference)
	{
		//Left, up, right, down, bit depth, primary monitor or otherwise (0/1), the taskbar position (left,top,right,bottom,unknown), the coordinates of where the taskbar is separated from the rest of the screen
		//Ex: 0,0,1600,900,32,1,bottom,1560
		local ref = ref.Split(",");
		local left = ref[0].ToNumber();
		local top = ref[1].ToNumber();
		local right = ref[2].ToNumber();
		local bottom = ref[3].ToNumber();
		local taskpos = ref[6];
		local taskbar = ref[7].ToNumber();
		
		if (taskpos == "left") left = taskbar;
		else if (taskpos == "top") top = taskbar;
		else if (taskpos == "right") right = taskbar;
		else if (taskpos == "bottom") bottom = taskbar;
		
		local width = abs(right) - abs(left);
		width = abs(width);
		
		local height = abs(bottom) - abs(top);
		height = abs(height);
		
		Display["{i}"] = {left: left, top: top, right: right, bottom: bottom, width: width, height: height};
	}
}

function OnSurfaceChange
{
	//SSP only, sorry
	//ID, Surface number, width, height
	local info = Shiori.Reference[2].Split(",");
	
	VisibleChars.Remove("{info[0]}");
	if (info[1] != -1) VisibleChars.Add("{info[0]}", info[1]);
	//Why do all the checks when I can just remove, and only add back if needed...
}

function OnNotifyUserInfo
{
	Save.Data.Username = Shiori.Reference[0];
	local birthdate = Shiori.Reference[2].Split(",");
	Birthday = {month: birthdate[1].ToNumber(), day: birthdate[2].ToNumber()};
}

//Sakura names
function otherghostname
{
	OpenGhosts = [];
	for (local i = 0; i < Shiori.Reference.length; i++)
	{
		local split = Shiori.Reference[i].Split("{(1).ToAscii()}");
		OpenGhosts.Add(split[0]);
	}
}

//Full ghost names
//Note - it seems this includes THIS ghost in the count
function installedghostname
{
	InstalledGhosts = [];
	for (local i = 0; i < Shiori.Reference.length; i++)
	{
		InstalledGhosts.Add(Shiori.Reference[i]);
	}
}


//——————————————— Debug (delete later probably) ———————————————
function OnTestCurve
{
	local output = "\b[2]\![set,autoscroll,disable]\![no-autopause]\_q";
	for (local i = 0; i < 100; i++)
	{
		local spawntime = ItemSpawnTime(i);
		output += "{i}: {TimeDisplay(spawntime)} \f[color,disable]({spawntime})\f[color,default]\n";
	}
	output += "\x";
	return output;
}

function TimeDisplay(input)
{
	local output = "";
	
	local hours = (input / 3600).Floor();
	input = input % 3600;
	local minutes = (input / 60).Floor();
	local seconds = (input % 60).Floor();
	
	if (hours > 0) output += "{hours}h ";
	output += "{minutes}m ";
	output += "{seconds}s";
	return output;
}