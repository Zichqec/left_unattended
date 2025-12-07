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
	
	m += "\0\b[0]\![no-autopause]\![quicksection,1]\![set,autoscroll,disable]";
	m += "{OnSurfaceRestore}";
	m += "Hello!\n\n";
	m += "\![*]\__q[OnAITalk]Talk\__q  ";
	
	if (LastTalk == "") m += "\f[color,disable]\![*]Repeat\f[color,default]";
	else m += "\![*]\__q[OnLastTalk]Repeat\__q";
	
	m += "\n\n";
	m += "\![*]\__q[OnSettings]Settings\__q\n\n";
	
	m += "\![*]\__q[OnSpawnItem]Spawn object\__q\n";
	m += "\![*]\__q[OnSpawnGuest]Spawn guest\__q\n\n";
	
	m += "\![*]\__q[OnBlank]Cancel\__q";
	
	m += "\n{PartyClutter.length} | {DecoCount} | {GuestCount}\n(Can spawn? {CanSpawnGuest}\n Too many? {TooManyGuests})\n\n";
	foreach (item in Display)
	{
		m += "{item.width}x{item.height} - {item.bottom}\n";
	}
	
	return m;
}

function OnLastTalk
{
	return LastTalk;
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
	
	return PartyClutter["{p}"].Vanish() + OnSurfaceRestore();
}