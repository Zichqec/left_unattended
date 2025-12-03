
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