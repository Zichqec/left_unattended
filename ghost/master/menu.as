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
	
	m += "\![*]\__q[OnSpawnItem]Spawn object\__q\n\n";
	
	m += "\![*]\__q[OnBlank]Cancel\__q";
	
	m += "\n{PartyClutter.length} | {DecoCount} | {GuestCount} | (Can spawn? {CanSpawnGuest} - rate: {ItemSpawnTime})\n\n";
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

//Deco menu specific
function OnDismissItem
{
	local p = Shiori.Reference[0].ToNumber();
	
	return PartyClutter["{p}"].Vanish() + OnSurfaceRestore();
}