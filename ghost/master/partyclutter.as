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
			local move = "\![move,--x={this.initX},--y={this.initY},--time=0,--base=primaryscreen]";
			return "\p[{this.p}]\![set,alpha,0]\s[{this.surface}]\![set,alignmenttodesktop,{this.alignment}]{move}{move}\![set,alpha,100]";
		}
		else
		{
			return "\p[{this.p}]\s[{this.surface}]\![set,alpha,100]";
		}
	}
}

//Common to all party decorative objects
class PartyDeco : PartyThing
{
	init
	{
		//For determining the difference between deco and guests...
		this.type = "deco";
		
		this.pets = 0;
		
		local rand = Random.GetIndex(0,100);
		
		//They're jumping around the screen... how odd
		//Maybe I can accomodate for it by making each one grab its own coords and jump back to its proper position after the align command?
		local pick = Random.Select(FreeDeco());
		if (rand >= 80)
		{
			this.alignment = "bottom";
			pick = Random.Select(BottomDeco());
		}
		else if (rand >= 60)
		{
			this.alignment = "top";
			pick = Random.Select(TopDeco());
		}
		else if (rand >= 50)
		{
			this.alignment = "left";
			pick = Random.Select(LeftDeco());
		}
		else if (rand >= 40)
		{
			this.alignment = "right";
			pick = Random.Select(RightDeco());
		}
		this.specifictype = pick.name;
		this.surface = pick.surface;
		
		local flavortext = Reflection.Get("Deco{Capitalize(this.alignment)}Talk@{this.specifictype}");
		if (flavortext.IsNull()) flavortext = Reflection.Get("DecoTalk@fallback");
		this.flavortext = flavortext(this.p); //Assign it to *one* output... hopefully
		
		local len = Display.length;
		local display = Display["{Random.GetIndex(0,len)}"];
		
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
		m += this.flavortext; //I had the argument here, but I moved it up because I made it so that it saves one output and always displays that for a deco...
		m += "\n\n";
		m += "\![*]\__q[OnDismissItem,{this.p}]Remove item\__q\n\n";
		m += "\![*]\__q[OnBlank]Cancel\__q";
		
		return m;
	}
	
	function Vanish
	{
		PartyClutter.Remove("{this.p}");
		local dialogue = Reflection.Get("Deco{Capitalize(this.alignment)}Close@{this.specifictype}");
		if (dialogue.IsNull()) dialogue = DecoClose@fallback;
		return dialogue(this.p);
	}
	
	function Pet
	{
		this.pets++;
		
		if (this.pets >= 3)
		{
			//I want to abstract these out but I'm not sure where to put them...
			PartyClutter.Remove("{this.p}");
			if (DecoCount() == 0) return CloseStopTouchingThingsTalk(this.p) + "\_w[1000]\-";
			else
			{
				local dialogue = Reflection.Get("Deco{Capitalize(this.alignment)}PetClose@{this.specifictype}");
				if (dialogue.IsNull()) dialogue = DecoPetClose@fallback;
				return dialogue(this.p);
			}
		}
		else
		{
			local dialogue = Reflection.Get("Deco{Capitalize(this.alignment)}Pet@{this.specifictype}");
			if (dialogue.IsNull()) dialogue = DecoPet@fallback;
			return dialogue(this.p);
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
		
		local pick = Random.Select(GuestTypes());
		this.specifictype = pick.name;
		this.surface = pick.surface;
		
		this.alignment = "free";
		
		this.personality = Random.Select([
			"sassy",
			"cheery",
		]);
		
		this.flavortext = Reflection.Get("GuestTalk@{Capitalize(this.personality)}");
		if (this.flavortext.IsNull()) this.flavortext = GuestTalk@fallback;
		
		local len = Display.length;
		local display = Display["{Random.GetIndex(0,len)}"];
		
		local rightbound = display.width - this.width;
		
		this.initX = Random.GetIndex(0,rightbound) - display.left;
		
		//local upperbound = ((display.height / 6) * 5).Floor() - this.height;
		this.height = 270; //TODO TEMP
		
		local lowerbound = display.height - this.height;
		local upperbound = lowerbound - (this.height / 2).Floor();
		this.initY = lowerbound;
		
		if (upperbound < lowerbound) this.initY = Random.GetIndex(upperbound,lowerbound);
	}
	
	//Not really a menu, probably should rename... idk, may add buttons, hmm
	function Menu
	{
		local m = "";
		
		m += this.flavortext(this.p);
		
		return m;
	}
	
	function Vanish
	{
		local dialogue = Reflection.Get("GuestLeave@{Capitalize(this.personality)}");
		if (dialogue.IsNull()) dialogue = GuestLeave@fallback;
		
		PartyClutter.Remove("{this.p}");
		
		return dialogue(this.p);
	}
}