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
}

function username
{
	return Save.Data.Username;
}

function otherghostname
{
	OpenGhosts = [];
	for (local i = 0; i < Shiori.Reference.length; i++)
	{
		local split = Shiori.Reference[i].Split("{(1).ToAscii()}");
		OpenGhosts.Add(split[0]);
	}
}

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
}

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


function GuestSpawnTime
{
	return Random.GetIndex(2,7) * 10; //20-60
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

function TooManyGuests
{
	local decocount = DecoCount() - 3;
	
	if (GuestCount() > (decocount * 1.5).Floor() && GuestCount() > 0) return true;
	else return false;
}

function ItemSpawnTime(test)
{
	local decocount = DecoCount();
	if (!test.IsNull()) decocount = test;
	if (decocount < 3) return 30;
	else
	{
		//OH GOD I'M SO BAD AT MATH WHAT AM I DOING
		
		//I would like to thank Balatro for guiding me towards the solution, truly this would not have been possible without your support
		local decomult = (decocount / 75) + 1;
		local output = 30;
		for (local i = 0; i < decocount; i++)
		{
			output *= decomult;
		}
		return output.Floor();
	}
}

function TestCurve, On
{
	local output = "\b[2]\![set,autoscroll,disable]\_q";
	for (local i = 0; i < 50; i++)
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