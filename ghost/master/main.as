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
	LastItemSpawn = Time.GetNowUnixEpoch();
	
	//This one is the other way around so we can have a little randomness to it...
	NextGuestSpawn = Time.GetNowUnixEpoch() + GuestSpawnTime();
	ActionBufferTime = Time.GetNowUnixEpoch();
	
	LastX = 0;
	LastY = 0;
	
	OnSpawnItem();
	OnSpawnItem();
	OnSpawnItem();
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
		//- Do we want these to be adjustable?
			//- Items spawn at a slower rate the more there are. natural soft cap. no adjustment allowed
			//- 60s * 1.25 for each item? possibly starting at 3 items, and when you're at less than that it's a lower rate?
	
- Guests can either be silhouette people? lil guys? or, they can be other ghosts
	- Toggleable option for it to be just silhouette guys, other ghosts, or both
	- Other ghosts are VIPs and work separately
		- Should she maybe be able to close despite them if you close all her items...? That'd probably be for the best... otherwise this ghost will be my personal hell lol
	//- Silhouette people appear and disappear based on how much deco is present. They are for flavor text only
		//- Current planned rate is 1.5 people per 1 deco, starting after at least 3 deco
	
- If you close everything, it becomes possible to close her normally
	- Possibly a chance for her to refuse to go and pull out another item or three
	- If you pet everything too much, she closes herself

//- Double click items to dismiss them
	//- Possibly flavor text when you click them? If it's a guest that isn't a ghost, a comment? Would like said text to be assigned when the item is created

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
		return "\p[{this.p}]\s[{this.surface}]\![get,property,OnGetPosition,currentghost.scope({this.p}).rect]\![set,alignmenttodesktop,{this.alignment}]\![embed,OnReturnToPosition]";
	}
}

//This is a patch for an SSP issue where the alignment commands make the characters jump all over the place if they are aligned differently... it still jumps a bit but at least now they return to their original positions
function OnGetPosition
{
	local coords = Shiori.Reference[0].Split(",");
	LastX = coords[0];
	LastY = coords[1];
}

function OnReturnToPosition
{
	return "\![move,--x={LastX},--y={LastY},--time=0,--base=primaryscreen]";
}

//Common to all party decorative objects
class PartyDeco : PartyThing
{
	init
	{
		//For determining the difference between deco and guests...
		this.type = "deco";
		
		this.flavortext = "{flavortest}";
		
		local rand = Random.GetIndex(0,100);
		this.surface = "1000";
		
		//They're jumping around the screen... how odd
		//Maybe I can accomodate for it by making each one grab its own coords and jump back to its proper position after the align command?
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
	
	function Vanish
	{
		local dialogue = "\p[{this.p}]\s[-1]Shoo,\w4 out of here...";
		PartyClutter.Remove("{this.p}");
		return dialogue;
	}
}

//Common to all party guests
class PartyGuest : PartyThing
{
	init
	{
		//For determining the difference between deco and guests...
		this.type = "guest";
		
		this.surface = "10";
		
		this.alignment = "free";
		
		this.flavortext = "{guestflavortest}";
	}
	
	//Not really a menu, probably should rename...
	function Menu
	{
		local m = "";
		
		m += "\p[{this.p}]\b[0]{this.flavortext}";
		
		return m;
	}
	
	function Vanish
	{
		local dialogue = "\p[{this.p}]\s[-1]I'm outta here lol";
		PartyClutter.Remove("{this.p}");
		return dialogue;
	}
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

function guestflavortest
{
	return Random.Select([
		"what's all this",
		"so weird",
		"party time yay!",
		"where's the cake?",
		"who are you?",
		"is this supposed to be a party?",
	]);
}

function OnSecondChange
{
	local epoch = Time.GetNowUnixEpoch();
	if (CanTalk() && epoch - ActionBufferTime >= 10) //I could use reference3 instead of CanTalk, but...
	{
		local since = epoch - LastItemSpawn;
		local nextitem = LastItemSpawn + ItemSpawnTime();
		
		if (epoch >= nextitem)
		{
			//TODO something to think about: this will trigger if you dismiss items and the time until next item goes down... might be a nuisance but oh well! the alternative seems worse? maybe add a cooldown variable...
			LastItemSpawn = epoch;
			ActionBufferTime = epoch;
			return OnSpawnItem();
		}
		
		if (CanSpawnGuest())
		{
			if (epoch >= NextGuestSpawn)
			{
				NextGuestSpawn = epoch + GuestSpawnTime();
				ActionBufferTime = epoch;
				return OnSpawnGuest();
			}
		}
		
		if (TooManyGuests())
		{
			ActionBufferTime = epoch;
			return OnDespawnGuest();
		}
	}
}

function GuestSpawnTime
{
	return Random.GetIndex(3,13) * 10; //30-120
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