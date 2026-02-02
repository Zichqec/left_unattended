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
	}
	
	function SurfaceRestore
	{
		if (!this.pos_init)
		{
			this.pos_init = true;
			
			return "\p[{this.p}]\![set,alpha,0]\s[{this.surface}]\![get,property,OnGetRect,currentghost.scope({this.p}).rect]\![set,alignmenttodesktop,{this.alignment}]\![embed,OnInitializePos,{this.type},{this.alignment}]\![set,alpha,100]";
			//return "\_q\p[{this.p}]\![set,alpha,0]\s[{this.surface}]\![embed,OnDebugWidth] \![get,property,OnGetRect,currentghost.scope({this.p}).rect]\![embed,OnDebugWidth] \![set,alignmenttodesktop,{this.alignment}]\![embed,OnInitializePos,{this.type},{this.alignment}]\![embed,OnDebugWidth] \![set,alpha,100]"; //for debugging...
		}
		else
		{
			return "\p[{this.p}]\s[{this.surface}]\![set,alpha,100]";
		}
	}
}

function OnTest
{
	if (LastDebugNum.IsNull()) LastDebugNum = 0;
	LastDebugNum++;
	
	return "\_q\![no-autopause]\p[{LastDebugNum}]\s[10000]Character: {LastDebugNum}\nLast width: {LastDebugWidth}\n\![get,property,OnDebugRect,currentghost.scope({LastDebugNum}).rect]After property command: \![embed,OnDebugWidth]\x";
}

function OnDebugRect
{
	local reference0 = Shiori.Reference[0].Split(",");
	local left = reference0[0].ToNumber();
	local top = reference0[1].ToNumber();
	local right = reference0[2].ToNumber();
	local bottom = reference0[3].ToNumber();
	
	LastDebugWidth = abs(right - left);
	LastDebugHeight = abs(bottom - top);
}

function OnDebugWidth
{
	return LastDebugWidth;
	//return LastWidth;
}

//TODO IIRC the problem is that somehow this information isn't being saved at the right time or isn't being called at the right time. I think the reason that they sometimes spawn offscreen is that it sometimes thinks they have a different width than they really do
//I need a way to determine if that's true... and if so, determine what the cause is, and if I can work around it...
//All the math logic in the function after this *seems* correct to me... it's nothing difficult
//Ok, new info: if you reload the ghost completely it uninitializes all the windows, and then we can see with my debug info that everything starts as 114 width, which is Jes's width. likely her height also. Why does this happen...?
//I can probably make a simpler version for testing now...

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
	
	Debug.WriteLine("left: {left}");
	Debug.WriteLine("right: {right}");
	Debug.WriteLine("LastWidth: {LastWidth}");
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
		
		local flavortext = Reflection.Get("Deco{Capitalize(this.alignment)}@{this.specifictype}@Talk");
		if (flavortext.IsNull()) flavortext = Reflection.Get("Deco@Fallback@Talk");
		this.flavortext = flavortext(this.special); //Assign it to *one* output... hopefully
		
		local specialmenu = Reflection.Get("Deco{Capitalize(this.alignment)}@{this.specifictype}@MenuOpt");
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
	
	function Vanish //TODO this stopped removing items properly
	{
		ResetCooldown();
		
		PartyClutter.Remove("{this.p}");
		local dialogue = Reflection.Get("Deco{Capitalize(this.alignment)}@{this.specifictype}@Close");
		if (dialogue.IsNull()) dialogue = Deco@Fallback@Close;
		return "\p[{this.p}]" + dialogue(this.p, this.special);
	}
	
	//Petting and poking have HER as the default talker, while other things have the individual item as the default.
	//My workaround in OnTranslate means that placing a \0 at the start of a dialogue on its own doesn't work properly... this may come back to bite me later. Can double-write them if needed... It seems to be that Aosora is collapsing a manually placed \0 into the auto placed one.
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
				ResetCooldown();
				
				local dialogue = Reflection.Get("Deco{Capitalize(this.alignment)}@{this.specifictype}@PetClose");
				if (dialogue.IsNull()) dialogue = Deco@Fallback@PetClose;
				return "\t\![enter,nouserbreakmode]" + dialogue(this.p, this.special) + "\![leave,nouserbreakmode]";
			}
		}
		else
		{
			local dialogue = Reflection.Get("Deco{Capitalize(this.alignment)}@{this.specifictype}@Pet");
			if (dialogue.IsNull()) dialogue = Deco@Fallback@Pet;
			return dialogue(this.special);
		}
	}
	
	function NeedlePoke
	{
		this.needlepokes++;
		
		if (this.needlepokes >= 3)
		{
			//I want to abstract these out but I'm not sure where to put them...
			PartyClutter.Remove("{this.p}");
			if (DecoCount() == 0) return "\t" + CloseStopPokingThingsTalk(this.p) + "\_w[1000]\-";
			else
			{
				ResetCooldown();
				
				local dialogue = Reflection.Get("Deco{Capitalize(this.alignment)}@{this.specifictype}@NeedleClose");
				if (dialogue.IsNull()) dialogue = Deco@Fallback@NeedleClose;
				return "\t\![enter,nouserbreakmode]" + dialogue(this.p, this.special) + "\![leave,nouserbreakmode]";
			}
		}
		else
		{
			local dialogue = Reflection.Get("Deco{Capitalize(this.alignment)}@{this.specifictype}@NeedlePoke");
			if (dialogue.IsNull()) dialogue = Deco@Fallback@NeedlePoke;
			return dialogue(this.special);
		}
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
		
		this.flavortext = Reflection.Get("Guest@{Capitalize(this.personality)}@Talk");
		if (this.flavortext.IsNull()) this.flavortext = Guest@Fallback@Talk;
		
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
	
	//Not really a menu, probably should rename... idk, may add buttons, hmm
	function Menu
	{
		local m = "\p[{this.p}]";
		
		m += this.flavortext();
		
		return m;
	}
	
	function Vanish
	{
		local dialogue = Reflection.Get("Guest@{Capitalize(this.personality)}@Leave");
		if (dialogue.IsNull()) dialogue = Guest@Fallback@Leave;
		
		PartyClutter.Remove("{this.p}");
		
		return "\t\p[{this.p}]" + dialogue() + "\s[-1]"; //\![set,alpha,0,500]\_w[500]\s[-1]\![set,alpha,100]
	}
	
	function NeedlePoke
	{
		this.needlepokes++;
		
		if (this.needlepokes >= 3)
		{
			//I want to abstract these out but I'm not sure where to put them...
			PartyClutter.Remove("{this.p}");
			
			ResetCooldown();
			
			local dialogue = Reflection.Get("Guest@{Capitalize(this.personality)}@NeedleLeave");
			if (dialogue.IsNull()) dialogue = Guest@Fallback@NeedleLeave;
			return "\t\p[{this.p}]" + dialogue(this.special) + "\s[-1]";
		}
		else
		{
			local dialogue = Random.Select([
				"\i[10]",
				"\i[12]",
				"\i[15]",
				"\i[16]",
				"\i[17]",
				"\i[18]",
			]);
			return "\p[{this.p}]\s[{this.surface}]" + dialogue;
		}
	}
}

function GuestPersonalities
{
	return [
		"cheery",
		"sassy",
		"shy",
	];
}

//TODO i tried to set these up so that I didn't have to send the p number, but unfortunately Aosora's head setting was getting in the way even when i turned it off...? May need to follow up on this one. Perhaps update the Aosora dll on another ghost and see if behavior changes...
//I put in a bandaid patch with OnTranslate because it seems this is a very difficult issue...