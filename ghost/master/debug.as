//The debugging functions have gotten extensive... best put them in their own file

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
	
	if (!holiday.IsNull()) return InitItemPos() + "\0\s[0]" + BootHolidayTalk(holiday);
	else return InitItemPos() + "\0\s[0]" + BootTalk();
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
			local debugsurface = item.surface;
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