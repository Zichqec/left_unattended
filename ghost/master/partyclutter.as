
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
			
			if (!PartyClutter.Contains("{p}")) valid = 1;
		}
		this.p = p;
		
		this.alignment = "free";
		
		this.pos_init = false;
		this.width = 300; //temp... i guess i'm going to have to account for different sizes regardless due to scaling
		this.height = 300; //temp ↑
	}
	
	function SurfaceRestore
	{
		if (!this.pos_init)
		{
			this.pos_init = true;
			local script = "\![!!!!!]\p[{this.p}]\![set,alpha,0]\s[{this.surface}]\![set,alignmenttodesktop,{this.alignment}]\![move,--x={this.initX},--y={this.initY},--time=0,--base=primaryscreen]\![set,alpha,100]";
			return script + script;
		}
		else
		{
			return "\p[{this.p}]\s[{this.surface}]\![get,property,OnGetPosition,currentghost.scope({this.p}).rect]\![set,alpha,0]\![set,alignmenttodesktop,{this.alignment}]\![embed,OnReturnToPosition]\![set,alpha,100]";
		}
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
	//I've never pinned down why doing it twice makes it work better...
	local script = "\![move,--x={LastX},--y={LastY},--time=0,--base=primaryscreen]";
	return script + script;
}

//Common to all party decorative objects
class PartyDeco : PartyThing
{
	init
	{
		//For determining the difference between deco and guests...
		this.type = "deco";
		
		this.flavortext = "{flavortest}";
		this.pets = 0;
		
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
		
		local len = Display.length;
		local display = Display["{Random.GetIndex(0,len)}"];
		Debug.WriteLine("len: {len}");
		Debug.WriteLine("display: {display}");
		Debug.WriteLine("display.width: {display.width}");
		Debug.WriteLine("display.height: {display.height}");
		
		local rightbound = display.width - this.width;
		
		this.initX = Random.GetIndex(0,rightbound) - display.left;
		
		local lowerbound = display.height - this.height;
		this.initY = Random.GetIndex(0,lowerbound) - display.top;
		
		//Maybe adjust later, i just don't want to duplicate code, blagh. maybe a function within the PartyThing class??
		//i guess really i will have to wait to see what items we get, because the level they should be placed at may change based on what they are... perhaps they should get their own classes? ugh but how would i make that happen...
		if (this.alignment == "free") this.initY = lowerbound;
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
	
	function Pet
	{
		this.pets++;
		
		if (this.pets >= 3)
		{
			PartyClutter.Remove("{this.p}");
			return "\0Stop being weird, omg!!! \p[{this.p}]\s[-1]\0I'll have to fix this up, ugh.";
		}
		else
		{
			return "\0Stop messing up my stuff!!";
		}
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
		
		local len = Display.length;
		local display = Display["{Random.GetIndex(0,len)}"];
		
		local rightbound = display.width - this.width;
		
		this.initX = Random.GetIndex(0,rightbound) - display.left;
		
		local upperbound = ((display.height / 6) * 5).Floor() - this.height;
		local lowerbound = display.height - this.height;
		this.initY = lowerbound;
		
		if (upperbound < lowerbound) this.initY = Random.GetIndex(upperbound,lowerbound);
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