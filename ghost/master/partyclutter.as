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
		
		this.needlepokes = 0;
		this.cakesgiven = 0;
		
		this.slicesleft = Random.GetIndex(5,10);
	}
	
	function SurfaceRestore
	{
		local restore = "\p[{this.p}]";
		if (!this.pos_init)
		{
			this.pos_init = true;
			
			//The solution to items appearing off the right side (and possibly bottom) was to add a little pause before the property command... odd. I also tried putting the property command in an embed tag but it seems that wasn't necessary, so I removed it.
			//Split this across multiple lines for readability
			restore += "\![set,alpha,0]\s[{this.surface}]\_w[50]";
			restore += "\![get,property,OnGetRect,currentghost.scope({this.p}).rect]\![set,alignmenttodesktop,{this.alignment}]";
			restore += "\![embed,OnInitializePos,{this.type},{this.alignment}]";
		}
		else
		{
			restore += "\p[{this.p}]\s[{this.surface}]";
		}
		
		restore += "\![set,alpha,100]";
		
		//I'm really surprised I can check for this.personality here without it erroring, since this variable doesn't exist for deco... but it's working, so...
		//Disabled for now because it doesn't work while dragging. May be replaced later depending on how certain things are resolved
		//if (this.personality == "restrained") restore += "\![lock,repaint,manual]";
		//else restore += "\![unlock,repaint]";
		
		return restore;
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
	init (debugalignment, debugspecifictype, debugsurface, debugspecial)
	{
		//For determining the difference between deco and guests...
		this.type = "deco";
		
		this.pets = 0;
		
		local rand = Random.GetIndex(0,100);
		
		//Set to "free" by default by parent class
		if (rand >= 80) this.alignment = "bottom";
		else if (rand >= 60) this.alignment = "top";
		else if (rand >= 50) this.alignment = "left";
		else if (rand >= 40) this.alignment = "right";
		
		if (!debugalignment.IsNull()) this.alignment = debugalignment; //Set via debug
		
		local pick = Random.Select(FreeDeco());
		if (this.alignment == "left") pick = Random.Select(LeftDeco());
		if (this.alignment == "top") pick = Random.Select(TopDeco());
		if (this.alignment == "right") pick = Random.Select(RightDeco());
		if (this.alignment == "bottom") pick = Random.Select(BottomDeco());
		
		
		this.specifictype = pick.name;
		this.surface = pick.surface;
		this.special = null;
		
		if (!pick.variants.IsNull())
		{
			local variantpick = Random.Select(pick.variants);
			this.surface = variantpick.surface;
			this.special = variantpick.special;
		}
		
		
		if (!(debugsurface.IsNull() || debugsurface == "")) this.surface = debugsurface; //Set via debug
		if (!(debugspecial.IsNull() || debugspecial == "")) this.special = debugspecial; //Set via debug
		if (!(debugspecifictype.IsNull() || debugspecifictype == "")) this.specifictype = debugspecifictype; //Set via debug
		
		this.special_funcname = this.special.ToString();
		this.special_funcname = this.special_funcname.Replace(" ","_");
		
		local flavortext = this.FindDialogue("Talk");
		this.flavortext = flavortext(this.special); //Assign it to *one* output... hopefully
		
		local specialmenu = this.FindDialogue("MenuOpt");
		this.specialmenu = specialmenu(this.p,this.special);
	}
	
	//Run through dialogues from most to least specific until we get one
	//Special variants > overall types > fallbacks
	//returns a FUNCTION not a name or single baked output, because sometimes we want to call multiple options (well, I guess that's more for the guests) and sometimes we want to send it with arguments
	function FindDialogue(type)
	{
		local funcname = Reflection.Get("Deco{Capitalize(this.alignment)}@{this.specifictype}@{this.special_funcname}@{type}");
		if (funcname.IsNull()) funcname = Reflection.Get("Deco{Capitalize(this.alignment)}@{this.specifictype}@{type}");
		if (funcname.IsNull()) funcname = Reflection.Get("Deco@Fallback@{type}");
		return funcname;
	}
	
	//Like the above but for handling special close conditions
	function SpecialClose(type)
	{
		local output = "";
		local funcname = Reflection.Get("Deco{Capitalize(this.alignment)}@{this.specifictype}@{this.special_funcname}@{type}");
		if (funcname.IsNull()) funcname = Reflection.Get("Deco{Capitalize(this.alignment)}@{this.specifictype}@{type}");
		//No fallback here because if it falls back we want to go to the overall dialogues, with different behavior...
		
		if (!funcname.IsNull())
		{
			output += funcname(this.p) + "\x";
		
			output += "\t" + SpecialClose@Continuation(this.p);
		}
		else
		{
			output += "\t" + Reflection.Get("SpecialClose@{type}")(this.p);
		}
		output += "\_w[1000]\-";
		return output;
	}
	
	//Finally found a good way to abstract out this function! Yay!
	function TakeDownItem(type)
	{
		PartyClutter.Remove("{this.p}");
		if (DecoCount() == 0) return this.SpecialClose("{type}");
		else
		{
			ResetCooldown();
			
			local dialogue = this.FindDialogue("{type}");
			return "\t\![enter,nouserbreakmode]" + dialogue(this.p, this.special) + "\![leave,nouserbreakmode]";
		}
	}
	
	function Menu
	{
		local m = "";
		
		m += "\p[{this.p}]\b[0]\![no-autopause]\![quicksection,1]\![set,autoscroll,disable]";
		m += this.flavortext; //I had the argument here, but I moved it up because I made it so that it saves one output and always displays that for a deco...
		m += "\n\n";
		m += this.specialmenu;
		m += "\![*]\__q[OnDismissItem,{this.p}]Remove item\__q    ";
		m += "\![*]\__q[OnBlank]Cancel\__q";
		
		return m;
	}
	
	function Vanish
	{
		ResetCooldown();
		
		PartyClutter.Remove("{this.p}");
		local dialogue = this.FindDialogue("Close");
		return "\p[{this.p}]" + dialogue(this.p, this.special);
	}
	
	//Petting and poking have HER as the default talker, while other things have the individual item as the default.
	//My workaround in OnTranslate means that placing a \0 at the start of a dialogue on its own doesn't work properly... this may come back to bite me later. Can double-write them if needed... It seems to be that Aosora is collapsing a manually placed \0 into the auto placed one.
	function Pet
	{
		this.pets++;
		
		if (this.pets >= 3)
		{
			return this.TakeDownItem("PetClose");
		}
		else
		{
			local dialogue = this.FindDialogue("Pet");
			return dialogue(this.special);
		}
	}
	
	function NeedlePoke
	{
		this.needlepokes++;
		
		if (this.needlepokes >= 3)
		{
			return this.TakeDownItem("NeedleClose");
		}
		else
		{
			local dialogue = this.FindDialogue("NeedlePoke");
			return dialogue(this.special);
		}
	}
	
	//"give" cake... via BirthdayNeedle
	function GiveCake
	{
		this.cakesgiven++;
		
		if (this.cakesgiven >= 3)
		{
			return this.TakeDownItem("CakeClose");
		}
		else
		{
			local dialogue = this.FindDialogue("GiveCake");
			return dialogue(this.special);
		}
	}
	
	function PhantaEepy
	{
		return OnDecoPhantaEepy(this.specifictype, this.special);
	}
}

//Common to all party guests
class PartyGuest : PartyThing
{
	init (debugpersonality, debugsurface, debugspecial)
	{
		//For determining the difference between deco and guests...
		this.type = "guest";
		
		local pick = Random.Select(GuestTypes());
		this.specifictype = pick.name;
		this.surface = pick.surface;
		
		this.alignment = "free";
		
		this.personality = Random.Select(GuestPersonalities());
		//Note to self - as in the debug menu, had to switch from a null check here to an empty string check... need to pin this down
		//It varies based on normal spawning vs debug spawning....... sometimes it's null, sometimes it's not null but it is an empty string
		if (!(debugpersonality.IsNull() || debugpersonality == "")) this.personality = debugpersonality; //Specific pick via debug
		
		this.flavortext = this.FindDialogue("Talk");
		
		//Copied from partydeco but i don't think i can make this be in the PartyThing class...
		this.special = null;
		
		if (!pick.variants.IsNull())
		{
			local variantpick = Random.Select(pick.variants);
			this.surface = variantpick.surface;
			this.special = variantpick.special;
		}
		
		if (!(debugsurface.IsNull() || debugsurface == "")) this.surface = debugsurface; //Specific pick via debug
		if (!(debugspecial.IsNull() || debugspecial == "")) this.special = debugspecial; //Specific pick via debug
	}
	
	//Run through dialogues from most to least specific until we get one
	//Special variants > overall types > fallbacks
	//returns a FUNCTION not a name or single baked output, because sometimes we want to call multiple options and sometimes we want to send it with arguments
	function FindDialogue(type)
	{
		local funcname = Reflection.Get("Guest@{Capitalize(this.personality)}@{type}");
		if (funcname.IsNull()) funcname = Reflection.Get("Guest@Fallback@{type}");
		return funcname;
	}
	
	//Not really a menu, probably should rename... idk, may add buttons, hmm
	function Menu
	{
		local m = "\p[{this.p}]";
		
		m += this.flavortext();
		
		return m;
	}
	
	function Vanish
	{
		local dialogue = this.FindDialogue("Leave");
		
		PartyClutter.Remove("{this.p}");
		
		return "\t\p[{this.p}]" + dialogue() + "\![set,alpha,0,500,--wait]\s[-1]"; //\![set,alpha,0,500]\_w[500]\s[-1]\![set,alpha,100]
	}
	
	function NeedlePoke
	{
		this.needlepokes++;
		
		if (this.needlepokes >= 3)
		{
			PartyClutter.Remove("{this.p}");
			
			ResetCooldown();
			
			local dialogue = this.FindDialogue("NeedleLeave");
			return "\t\p[{this.p}]" + dialogue(this.special) + "\s[-1]";
		}
		else
		{
			local dialogue = Random.Select([
				"\i[10]",
				"\i[12]",
			]);
			return "\p[{this.p}]\s[{this.surface}]" + dialogue;
		}
	}
	
	//via Birthday Needle
	function GiveCake
	{
		local dialogue = this.FindDialogue("GiveCake");
		
		return "\p[{this.p}]\s[{this.surface}]" + dialogue();
	}
	
	function PhantaEepy
	{
		local dialogue = Random.Select([
			"\i[12]",
			"\i[13]",
		]);
		return "\p[{this.p}]\s[{this.surface}]" + dialogue;
	}
}

//TODO i tried to set these up so that I didn't have to send the p number, but unfortunately Aosora's head setting was getting in the way even when i turned it off...? May need to follow up on this one. Perhaps update the Aosora dll on another ghost and see if behavior changes...
//I put in a bandaid patch with OnTranslate because it seems this is a very difficult issue...