//Default save data
function OnAosoraDefaultSaveData
{
	Save.Data.TalkInterval = 180;
	Save.Data.Username = "friend";
	Save.Data.ItemSpawnRate = 60;
	Save.Data.PartyClutterLimit = 20;
}

//Values to be set upon loading
function OnAosoraLoad
{
	TalkTimer.RandomTalk = OnSendTalk;
	TalkTimer.RandomTalkIntervalSeconds = Save.Data.TalkInterval;
	
	LastTalk = "";
	
	PartyClutter = {};
	VisibleChars = {};
	LastItemSpawn = Time.GetNowUnixEpoch();
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

function OnBoot()
{
	return BootTalk();
}

function OnClose()
{
	return CloseTalk() + "\_w[1000]\-";
}


/*

THE PLAN:

- Every X minutes, Jes spawns either party decor or a guest
	- Max cap of how many things can be open and how many ghosts can be summoned?
		- Do we want these to be adjustable?
			- Items spawn at a slower rate the more there are. natural soft cap. no adjustment allowed
			- 60s * 1.25 for each item? possibly starting at 3 items, and when you're at less than that it's a lower rate?
	
- Guests can either be silhouette people? lil guys? or, they can be other ghosts
	- Toggleable option for it to be just silhouette guys, other ghosts, or both
	- Other ghosts are VIPs and work separately
		- Should she maybe be able to close despite them if you close all her items...? That'd probably be for the best... otherwise this ghost will be my personal hell lol
	- Silhouette people appear and disappear based on how much deco is present. They are for flavor text only
		- Current planned rate is 1.5 people per 1 deco, starting after at least 3 deco
	
- If you close everything, it becomes possible to close her normally
	- Possibly a chance for her to refuse to go and pull out another item or three
	- If you pet everything too much, she closes herself

- Double click items to dismiss them
	- Possibly flavor text when you click them? If it's a guest that isn't a ghost, a comment? Would like said text to be assigned when the item is created

- Pet items and she comments about you messing it up or being gross
	- Do it enough and she takes the item down herself

- Could be funny if she notices and comments (minimally) on special dates like the user's birthday and various holidays

- If you pet-close her last item, she leaves in disgust
- If you menu-close her last item, it becomes possible to close her with the "close" option
- She needs a special reaction for the "quit" option, see if i can determine this even when she is the only open ghost


Item ideas:
- Tables with different kinds of refreshments
- Streamers that stick to the top
- Disco balls that stick to the top
- Lanterns that stick to the top
- Bunches of balloons with one of those weighted things to keep them down

*/

function OnSurfaceRestore, OnWindowStateRestore
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

function OnSpawnItem
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
		
		this.alignment = "free";
	}
	
	function SurfaceRestore
	{
		return "\p[{this.p}]\s[{this.surface}]\![set,alignmenttodesktop,{this.alignment}]";
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
		
		local rand = Random.GetIndex(0,100);
		this.surface = "1000";
		
		//They're jumping around the screen... how odd
		if (rand >= 80)
		{
			this.alignment = "bottom";
			this.surface = "2000";
		}
		else if (rand >= 60)
		{
			this.alignment = "top";
			this.surface = "3000";
		}
		else if (rand >= 50)
		{
			this.alignment = "left";
			this.surface = "4000";
		}
		else if (rand >= 40)
		{
			this.alignment = "right";
			this.surface = "5000";
		}
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

function OnSecondChange
{
	local since = Time.GetNowUnixEpoch() - LastItemSpawn;
	
	if (since >= Save.Data.ItemSpawnRate && PartyClutter.length < Save.Data.PartyClutterLimit && CanTalk())
	{
		LastItemSpawn = Time.GetNowUnixEpoch();
		return OnSpawnItem();
	}
}