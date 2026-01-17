//——————————————— Menu greetings ———————————————
//I want to move these but not sure where to...
talk MenuGreeting
{
	\s[phone]Do you want something? I'm a bit busy.
}

talk MenuGreeting
{
	\s[eyeroll]\i[10]What is it now?
}

talk MenuGreeting
{
	\s[phone]Ooh, they have {bagsofglitter}. \s[tongue]Now we're talking.
}

talk MenuGreeting
{
	\s[phone]These party decorations aren't going to order themselves.
}

talk MenuGreeting
{
	\s[phone]I should probably get another cake. \s[tongue]Maybe two more cakes.
}

talk MenuGreeting
{
	\s[forward]If you're gonna stand around here then you better help me when the {pictureframesare} delivered.
}


//——————————————— Menu code ———————————————
function OnMainMenu
{
	local m = "";
	
	m += "\0\b[0]\![no-autopause]\![quicksection,1]\![set,autoscroll,disable]";
	m += "{OnSurfaceRestore}";
	m += "\n\n\n";
	m += "\![*]\__q[OnAITalk]Talk\__q  ";
	
	if (LastTalk == "") m += "\f[color,disable]\![*]Repeat\f[color,default]";
	else m += "\![*]\__q[OnLastTalk]Repeat\__q";
	
	m += "  \![*]\__q[OnClose]Please leave\__q";
	m += "\n\n";
	m += "\![*]\__q[OnSettings]Settings\__q\n\n";
	
	m += "\![*]\__q[OnBlank]Cancel\__q";
	
	if (IsDebugMode)
	{
		local label = "On"; if (Save.Data.SpawningEnabled == 0) label = "Off";
		m += "\n\nSpawning: \__q[OnDebug@ToggleSpawning]{label}\__q    ";
		
		m += "\![*]\__q[OnDebug@SpawnMenu]Spawn...\__q  ";
		m += "\![*]\__q[OnSpawnItem]Object\__q  ";
		m += "\![*]\__q[OnSpawnGuest]Guest\__q";
		m += "\nVIP? {CanSpawnVIP} | Current {VIPCount}";
		//m += "\n{PartyClutter.length} | {DecoCount} | {GuestCount}\n(Can spawn? {CanSpawnGuest}\n Too many? {TooManyGuests})\n\n";
		// foreach (item in Display)
		// {
			// m += "{item.width}x{item.height} - {item.bottom}\n";
		// }
	}
	
	m += "\_l[0,0]\![quicksection,0]";
	m += AutoPause(MenuGreeting());
	
	return m;
}

function OnSettings
{
	local m = "";
	m += "\0\b[0]\![no-autopause]\![quicksection,1]\![set,autoscroll,disable]\f[anchorvisitedfontcolor,default.anchor]";
	m += "\f[align,center]\f[height,+2]\f[bold,1] Settings \f[bold,default]\f[height,default]\n\f[align,left]\n";
	
	m += "\![*]Talk rate:\n";
	local times = [
		{label: "Off", interval: 0},
		{label: "1m", interval: 60},
		{label: "3m", interval: 180},
		{label: "5m", interval: 300},
		{label: "10m", interval: 600},
		{label: "15m", interval: 900},
	];
	
	for (i = 0; i < times.length; i++)
	{
		local time = times[i];
		
		if (time.interval == Save.Data.TalkInterval)
		{
			m += `\f[underline,1]\_a[OnChangeTalkrate,{time.interval}]{time.label}\_a\f[underline,default]  `;
		}
		else
		{
			m += `\__q[OnChangeTalkrate,{time.interval}]{time.label}\__q  `;
		}
	}
	m += "\n\n";
	
	local viplabel = "prohibited";
	if (Save.Data.VIPsAllowed == 1) viplabel = "allowed";
	m += "\![*]Spawning VIPs \_a[OnToggleVIPAllowed]{viplabel}\_a\n";
	m += "\f[color,disable](VIPs are other ghosts.)\f[color,default]";
	
	m += "\n\n";
	
	m += "\![*]\__q[OnMainMenu]Back\__q  ";
	m += "\![*]\__q[OnBlank]Cancel\__q";
	return m;
}

function OnChangeTalkrate
{
	local interval = Shiori.Reference[0];
	TalkTimer.RandomTalkIntervalSeconds = interval;
	TalkTimer.RandomTalkElapsedSeconds = 0;
	Save.Data.TalkInterval = interval;
	
	return OnSettings;
}

function OnToggleVIPAllowed
{
	if (Save.Data.VIPsAllowed != 1) Save.Data.VIPsAllowed = 1;
	else Save.Data.VIPsAllowed = 0;
	
	return OnSettings;
}

//Deco menu specific
function OnDismissItem
{
	local p = Shiori.Reference[0].ToNumber();
	
	return PartyClutter["{p}"].Vanish(); //Removed surface restore here because it was causing weirdness
}

function OnDebug@ToggleSpawning
{
	if (Save.Data.SpawningEnabled != 0) Save.Data.SpawningEnabled = 0;
	else Save.Data.SpawningEnabled = 1;
	return OnMainMenu;
}

//Manual call to test booting
function OnTestBoot
{
	local holiday = Shiori.Reference[0];
	
	if (!holiday.IsNull()) return SurfaceRefresh() + BootHolidayTalk(holiday);
	else return SurfaceRefresh() + BootTalk();
}

function OnDebug@SpawnMenu
{
	local m = "";
	m += "\0\b[0]\![no-autopause]\![quicksection,1]\![set,autoscroll,disable]\f[anchorvisitedfontcolor,default.anchor]";
	m += "\f[align,center]\f[height,+2]\f[bold,1] Spawn \f[bold,default]\f[height,default]\n\f[align,left]\n";
	
	m += "\![*]\__q[OnDebug@SpawnMenu@Guest]Guest\__q\n\n";
	m += "\![*]\__q[OnDebug@SpawnMenu@Object]Object\__q\n\n";
	
	m += "\![*]\__q[OnMainMenu]Back\__q  \![*]\__q[OnBlank]Close\__q";
	return m;
}

function OnDebug@SpawnMenu@Guest
{
	local debugpersonality = Shiori.Reference[0];
	local debugshape = Shiori.Reference[1];
	local debugsurface = Shiori.Reference[2].ToNumber();
	local debugspecial = Shiori.Reference[3];
	
	//Randomize here because it feels bad to do it in the partyclutter file...
	//Setting it manually for 12 colors, if we ever change it I'll need to adjust
	local variance = Random.GetIndex(0,12);
	local debugsurfacesend = "";
	if (debugsurface > 0) //If a surface is not chosen, skip
	{
		//NOTE TO SELF - this was originally a null check, but I had to change to checking for an empty string instead since I guess that's a bit weird with references? hmm
		if (debugspecial == "" && debugshape == "Beastfolk")
		{
			//Jump to a random one of the beastfolk numbers, to get a random variant... only if none is chosen
			variance += Random.Select([0,20,40]);
		}
		
		debugsurfacesend = debugsurface + variance;
	}
	
	local m = "";
	m += "\0\b[2]\![no-autopause]\![quicksection,1]\![set,autoscroll,disable]\f[anchorvisitedfontcolor,default.anchor]";
	m += "\f[align,center]\f[height,+2]\f[bold,1] Spawn guest \f[bold,default]\f[height,default]\n\f[align,left]\n";
	
	m += `Current: {debugpersonality} {debugshape} ({debugspecial}) | \__q[OnDebug@SpawnMenu@GuestSpawn,"{debugpersonality}","{debugshape}","{debugsurface}","{debugspecial}","{debugsurfacesend}"]Spawn!\__q\n\n`; //[{debugsurface} | {debugsurfacesend}]
	
	m += "\f[bold,1]Personality\f[bold,default]\n";
	m += `\_l[@1em]\![*]\__q[OnDebug@SpawnMenu@Guest,,"{debugshape}","{debugsurface}","{debugspecial}"]Random\__q\n`;
	foreach (personality in GuestPersonalities())
	{
		m += `\_l[@1em]\![*]`;
		if (debugpersonality == personality)
		{
			m += `\_a[OnDebug@SpawnMenu@Guest,"{personality}","{debugshape}","{debugsurface}","{debugspecial}"]{personality}\_a\n`;	
		}
		else
		{
			m += `\__q[OnDebug@SpawnMenu@Guest,"{personality}","{debugshape}","{debugsurface}","{debugspecial}"]{personality}\__q\n`;
		}
	}
	m += "\n";
	
	m += "\f[bold,1]Shape\f[bold,default]\n";
	m += `\_l[@1em]\![*]\__q[OnDebug@SpawnMenu@Guest,"{debugpersonality}"]Random\__q\n`;
	foreach (type in GuestTypes())
	{
		m += `\_l[@1em]\![*]`;
		if (debugshape == type.name)
		{
			m += `\_a[OnDebug@SpawnMenu@Guest,"{debugpersonality}","{type.name}","{type.surface}"]{type.name}\_a\n`;	
		}
		else
		{
			m += `\__q[OnDebug@SpawnMenu@Guest,"{debugpersonality}","{type.name}","{type.surface}"]{type.name}\__q\n`;
		}
		
		if (type.name == "Beastfolk")
		{
			local lastvariant = "";
			foreach (variant in type.variants)
			{
				//Skip types we've already seen - deals with beastfolk types being jammed into one overarching type
				if (variant.special == lastvariant) continue;
				lastvariant = variant.special;
				
				m += `\_l[@2em]\![*]`;
				if (debugspecial == variant.special)
				{
					m += `\_a[OnDebug@SpawnMenu@Guest,"{debugpersonality}","{type.name}","{variant.surface}","{variant.special}"]{variant.special}\_a\n`;	
				}
				else
				{
					m += `\__q[OnDebug@SpawnMenu@Guest,"{debugpersonality}","{type.name}","{variant.surface}","{variant.special}"]{variant.special}\__q\n`;
				}
			}
		}
	}
	m += "\n";
	
	// foreach (type in GuestTypes())
	// {
		// m += "\f[bold,1]{type.name}\f[bold,default]\n";
		// foreach (variant in type.variants)
		// {
			// m += "\![*]\__q[OnDebug@SpawnMenu@GuestSpawn,{variant.surface}]{variant.surface}";
			// if (variant.special != null) m += " ({variant.special})";
			// m += "\__q\n";
		// }
		// m += "\n";
	// }
	
	m += "\![*]\__q[OnDebug@SpawnMenu]Back\__q  \![*]\__q[OnBlank]Close\__q";
	return m;
}

function OnDebug@SpawnMenu@GuestSpawn()
{
	//Personality, surface, special
	return OnSpawnGuest(Shiori.Reference[0], Shiori.Reference[4], Shiori.Reference[3]) + OnDebug@SpawnMenu@Guest();
}

function OnDebug@SpawnMenu@Object
{
	local m = "";
	m += "\0\b[2]\![no-autopause]\![quicksection,1]\![set,autoscroll,disable]\f[anchorvisitedfontcolor,default.anchor]";
	m += "\f[align,center]\f[height,+2]\f[bold,1] Spawn object \f[bold,default]\f[height,default]\n\f[align,left]\n";
	
	local decotypes = {
		a_left:
		{
			name: "Left",
			list: LeftDeco(),
		},
		b_top:
		{
			name: "Top",
			list: TopDeco(),
		},
		c_right:
		{
			name: "Right",
			list: RightDeco(),
		},
		d_bottom:
		{
			name: "Bottom",
			list: BottomDeco(),
		},
		e_free:
		{
			name: "Free",
			list: FreeDeco(),
		},
	};
	
	foreach (type in decotypes)
	{
		m += `\f[bold,1]\![*]\__q[OnDebug@SpawnMenu@ObjectSpawn,"{type.name.ToLower()}"]{type.name}\__q\f[bold,default]\n`;
		foreach (item in type.list)
		{
			//Randomly pick traits because we can't send the associative array item, so we do the random operation here...
			local debugsurface = "";
			local debugspecial = "";
			if (!item.variants.IsNull())
			{
				local variantpick = Random.Select(item.variants);
				debugsurface = variantpick.surface;
				debugspecial = variantpick.special;
			}
			
			m += `\_l[@1em]\f[bold,1]\![*]\__q[OnDebug@SpawnMenu@ObjectSpawn,"{type.name.ToLower()}","{item.name}","{debugsurface}","{debugspecial}"]{item.name}\__q\f[bold,default]\n`;
			if (!item.variants.IsNull())
			{
				foreach (variant in item.variants)
				{
					m += `\_l[@2em]\![*]\__q[OnDebug@SpawnMenu@ObjectSpawn,"{type.name.ToLower()}","{item.name}","{variant.surface}","{variant.special}"]{variant.surface}`;
					if (variant.special != null) m += " ({variant.special})";
					m += "\__q\n";
				}
			}
			else
			{
				m += `\_l[@2em]\f[color,disable](No variants)\f[color,default]\n`;
			}
			m += "\n";
		}
		m += "\n";
	}
	
	m += "\![*]\__q[OnDebug@SpawnMenu]Back\__q  \![*]\__q[OnBlank]Close\__q";
	return m;
}

function OnDebug@SpawnMenu@ObjectSpawn
{
	return OnSpawnItem(Shiori.Reference[0],Shiori.Reference[1],Shiori.Reference[2],Shiori.Reference[3]) + OnDebug@SpawnMenu@Object();
}