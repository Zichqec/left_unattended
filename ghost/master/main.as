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
	CooldownTime = Time.GetNowUnixEpoch();
	
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

function OnCloseAll, OnGhostChanging
{
	return CloseDefeatTalk() + "\_w[1000]\-";
}

function OnClose
{
	if (DecoCount() == 0) return CloseCleanedUpTalk() + "\_w[1000]\-";
	else return CloseStillPartyingTalk() + "\e";
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

function OnSecondChange
{
	local epoch = Time.GetNowUnixEpoch();
	if (CanTalk() && epoch - CooldownTime >= 10) //I could use reference3 instead of CanTalk, but...
	{
		local since = epoch - LastItemSpawn;
		local nextitem = LastItemSpawn + ItemSpawnTime();
		
		if (epoch >= nextitem)
		{
			//TODO something to think about: this will trigger if you dismiss items and the time until next item goes down... might be a nuisance but oh well! the alternative seems worse? maybe add a cooldown variable...
			LastItemSpawn = epoch;
			CooldownTime = epoch; //TODO these cooldown things (that's what i should have called it lol) probably need to be moved so that if you manually dismiss stuff that also resets the cooldown
			return OnSpawnItem();
		}
		
		if (CanSpawnGuest())
		{
			if (epoch >= NextGuestSpawn)
			{
				NextGuestSpawn = epoch + GuestSpawnTime();
				CooldownTime = epoch;
				return OnSpawnGuest();
			}
		}
		
		if (TooManyGuests())
		{
			CooldownTime = epoch;
			return OnDespawnGuest();
		}
	}
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