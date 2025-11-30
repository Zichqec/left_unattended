//Default save data
function OnAosoraDefaultSaveData
{
	Save.Data.TalkInterval = 180;
	Save.Data.Username = "friend";
}

//Values to be set upon loading
function OnAosoraLoad
{
	TalkTimer.RandomTalk = OnSendTalk;
	TalkTimer.RandomTalkIntervalSeconds = Save.Data.TalkInterval;
	
	LastTalk = "";
	
	PartyClutter = {};
	VisibleChars = {};
}

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

function OnAnchorSelect
{
	if (Shiori.Reference[0].StartsWith("http://") || Shiori.Reference[0].StartsWith("https://"))
	{
		return `\j["{Shiori.Reference[0]}"]`;
	}
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

function OnKeyPress
{
	if (Shiori.Reference[0] == "f1") return "\![open,readme]";
	else if (Shiori.Reference[0] == "t") return OnAITalk;
	else if (Shiori.Reference[0] == "r") return OnLastTalk;
}

function OnWindowStateRestore
{
	return OnSurfaceRestore;
}

function OnBoot()
{
	return BootTalk();
}

function OnClose()
{
	return CloseTalk();
}

function OnNotifyUserInfo
{
	Save.Data.Username = Shiori.Reference[0];
}

function username
{
	return Save.Data.Username;
}


/*

THE PLAN:

- Every X minutes, Jes spawns either party decor or a guest
	- Max cap of how many things can be open and how many ghosts can be summoned?
	
- Guests can either be silhouette people? lil guys? or, they can be other ghosts
	- Toggleable option for it to be just silhouette guys, other ghosts, or both
	
- If you close everything, it becomes possible to close her normally
	- Possibly a chance for her to refuse to go and pull out another item or three
	- If you pet everything too much, she closes herself
	
- Double click items to dismiss them
	- Possibly flavor text when you click them? If it's a guest that isn't a ghost, a comment? Would like said text to be assigned when the item is created

- Pet items and she comments about you messing it up or being gross
	- Do it enough and she takes the item down herself

- Could be funny if she notices and comments (minimally) on special dates like the user's birthday and various holidays


Item ideas:
- Tables with different kinds of refreshments
- Streamers that stick to the top
- Disco balls that stick to the top
- Lanterns that stick to the top
- Bunches of balloons with one of those weighted things to keep them down

*/

function OnSurfaceRestore
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

function OnMainMenu
{
	local m = "";
	
	m += "\0\b[0]\![no-autopause]\![quicksection,1]";
	m += "{OnSurfaceRestore}";
	m += "Hello!\n\n";
	m += "\![*]\__q[OnAITalk]Talk\__q  ";
	
	if (LastTalk == "") m += "\f[color,disable]\![*]Repeat\f[color,default]";
	else m += "\![*]\__q[OnLastTalk]Repeat\__q";
	
	m += "\n\n";
	
	m += "\![*]\__q[OnDebug@SpawnObject]Spawn object\__q\n\n";
	
	m += "\![*]\__q[OnBlank]Cancel\__q";
	
	m += "\n{PartyClutter.length}\n\n";
	foreach (item in PartyClutter)
	{
		m += "{item.p}\n";
	}
	
	return m;
}

function OnLastTalk
{
	return LastTalk;
}

function OnDebug@SpawnObject
{
	local clutter = new PartyDeco();
	PartyClutter.Add("{clutter.p}", clutter);
	return OnSurfaceRestore();
}

//Common to all party things
class PartyThing
{
	init
	{
		this.surface = "10";
		
		local valid = 0;
		local p = 0;
		while (!valid)
		{
			p++; //This is ONE INDEXED because character 0 is the sakura
			
			//Assume it's valid unless proven otherwise
			valid = 1;
			if (PartyClutter.Contains("{p}")) valid = 0;
		}
		this.p = p;
	}
	
	function SurfaceRestore
	{
		return "\p[{this.p}]\s[{this.surface}]";
	}
	
	function Vanish
	{
		local dialogue = "\p[{this.p}]\s[-1]Shoo,\w4 out of here...";
		PartyClutter.Remove("{this.p}");
		return dialogue;
	}
}

//Common to all party decorative objects
class PartyDeco : PartyThing
{
	init
	{
		this.flavortext = "\p[{this.p}]{flavortest}";
	}
	
	function FlavorText
	{
		return this.flavortext;
	}
	
	function Menu
	{
		local m = "";
		
		m += "\p[{this.p}]\b[0]\![no-autopause]\![quicksection,1]";
		m += this.flavortext;
		m += "\n\n";
		m += "\![*]\__q[OnDismissItem,{this.p}]Remove item\__q\n\n";
		m += "\![*]\__q[OnBlank]Cancel\__q";
		
		return m;
	}	
}

function OnDismissItem
{
	local p = Shiori.Reference[0].ToNumber();
	
	return PartyClutter["{p}"].Vanish() + OnSurfaceRestore();
}

//Common to all party guests (ghosts excluded)
class PartyGuest : PartyThing
{
	
}

function flavortest
{
	return Random.Select([
		"flavor 0",
		"flavor 1",
		"flavor 2",
		"flavor 3",
		"flavor 4",
		"flavor 5",
	]);
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