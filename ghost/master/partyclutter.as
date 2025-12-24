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
	}
	
	function SurfaceRestore
	{
		if (!this.pos_init)
		{
			this.pos_init = true;
			
			return "\p[{this.p}]\![set,alpha,0]\s[{this.surface}]\![get,property,OnGetRect,currentghost.scope({this.p}).rect]\![set,alignmenttodesktop,{this.alignment}]\![embed,OnInitializePos,{this.type},{this.alignment}]\![set,alpha,100]";
		}
		else
		{
			return "\p[{this.p}]\s[{this.surface}]\![set,alpha,100]";
		}
	}
}

//For determining current width/height
function OnGetRect
{
	local reference0 = Shiori.Reference[0].Split(",");
	local left = reference0[0].ToNumber();
	local top = reference0[1].ToNumber();
	local right = reference0[2].ToNumber();
	local bottom = reference0[3].ToNumber();
	
	//TODO untested... need to check this on multiple monitors to be sure I got it the right way around
	LastWidth = abs(right - left);
	LastHeight = abs(bottom - top);
}

function OnInitializePos
{
	local type = Shiori.Reference[0];
	local alignment = Shiori.Reference[1];
	local itemwidth = LastWidth;
	local itemheight = LastHeight;
	
	local X = 0;
	local Y = 0;
	
	//Ok so I know I was handling everything as classes... but in this case, because I have to do it as an embed, we're going to be doing a bit in a non-class way. Oops!
	
	//For items that stick to the top or bottom: specific Y does not matter, only X
	//For items that stick to the left or right, specific X does not matter, only Y
	//For items aligned freely and guests, both matter
	//I say "specific" X and Y because they do still need to be bumped to different monitors...
	
	//Pick a random monitor to spawn on
	local len = Display.length;
	local display = Display["{Random.GetIndex(0,len)}"];
	
	//Get screen bounds, leaving space for the item to be displayed
	local rightbound = display.width - itemwidth;
	local lowerbound = display.height - itemheight;
	
	//Set the coords randomly
	X = Random.GetIndex(0,rightbound) - display.left;
	Y = Random.GetIndex(0,lowerbound) - display.top;
	
	//Randomize the upperbound slightly - should be reserved for free items, or possibly only guests
	//I decided it looks nicer if they all are flat on the floor... code left here in case we change our minds
	if (alignment == "free")
	{
		Y = lowerbound;
		//local upperbound = lowerbound - (itemheight / 6).Floor();
		//if (upperbound < lowerbound) Y = Random.GetIndex(upperbound,lowerbound); //Unless the upperbound gets wonked up, choose a value between the two
		//else Y = lowerbound;
	}
	
	
	//idk why but sometimes moving them twice helps it actually work... it's very strange. i should track it down and report it.
	local move = "\![move,--x={X},--y={Y},--time=0,--base=primaryscreen]";
	local output = "";
	if (alignment == "free") output += "\![set,alignmenttodesktop,bottom]"; //This align command and the one below are a patch because of an SSP issue where the move commands don't always move things, and also an issue i'm running into where the property command is lagging behind even if i added some pause time. fun!
	output += "{move}{move}";
	// if (IsDebugMode)
	// {
		// output += "\b[2]\![quicksection,1]\![no-autopause]";
		// output += "alignment: {alignment}\n\n";
		
		// output += "Display size: {display.width}x{display.height}\n";
		// output += "Item size: {itemwidth}x{itemheight}\n\n";
		
		// output += "rightbound: {rightbound}\n";
		// output += "lowerbound: {lowerbound}\n\n";
		
		// output += "X: {X}\n";
		// output += "Y: {Y}\n";
	// }
	if (alignment == "free") output += "\![set,alignmenttodesktop,free]";
	return output;
	//return "{move}{move}"; //{itemwidth}x{itemheight}";
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
		this.special = null;
		
		if (!pick.variants.IsNull())
		{
			local variantpick = Random.Select(pick.variants);
			this.surface = variantpick.surface;
			this.special = variantpick.special;
		}
		
		local flavortext = Reflection.Get("Deco{Capitalize(this.alignment)}Talk@{this.specifictype}");
		if (flavortext.IsNull()) flavortext = Reflection.Get("DecoTalk@fallback");
		this.flavortext = flavortext(this.p,this.special); //Assign it to *one* output... hopefully
		
		local specialmenu = Reflection.Get("Deco{Capitalize(this.alignment)}MenuOpt@{this.specifictype}");
		if (specialmenu.IsNull()) specialmenu = "";
		this.specialmenu = specialmenu(this.special);
	}
	
	function Menu
	{
		local m = "";
		
		m += "\p[{this.p}]\b[0]\![no-autopause]\![quicksection,1]\![set,autoscroll,disable]";
		m += this.flavortext; //I had the argument here, but I moved it up because I made it so that it saves one output and always displays that for a deco...
		m += "\n\n";
		m += this.specialmenu;
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
			if (DecoCount() == 0) return "\t" + CloseStopTouchingThingsTalk(this.p) + "\_w[1000]\-";
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
			"cheery",
			"sassy",
			"shy",
		]);
		
		this.flavortext = Reflection.Get("GuestTalk@{Capitalize(this.personality)}");
		if (this.flavortext.IsNull()) this.flavortext = GuestTalk@fallback;
		
		//Copied from partydeco but i don't think i can make this be in the PartyThing class...
		this.special = null;
		
		if (!pick.variants.IsNull())
		{
			local variantpick = Random.Select(pick.variants);
			this.surface = variantpick.surface;
			this.special = variantpick.special;
		}
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
		
		return "\t" + dialogue(this.p) + "\s[-1]";
	}
}

//TODO i tried to set these up so that I didn't have to send the p number, but unfortunately Aosora's head setting was getting in the way even when i turned it off...? May need to follow up on this one. Perhaps update the Aosora dll on another ghost and see if behavior changes...