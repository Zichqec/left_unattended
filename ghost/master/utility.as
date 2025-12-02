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