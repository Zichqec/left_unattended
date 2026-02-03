//Fallback cases for when there's no special response for a particular item type or guest personality

//Shouldn't happen... depends how we build it. Either way, avoids runtime errors. You know, I could also use try/catch for this...
//———————————————————— Guests ————————————————————
talk Guest@Fallback@Talk
{
	...
}

talk Guest@Fallback@Talk
{
	...
}


//———————————————————— Deco flavortext ————————————————————
talk Deco@Fallback@Talk
{
	{narrator}Where does she get all this stuff...?{narratoroff}
}

talk Deco@Fallback@Talk
{
	{narrator}How many party supplies can one elf set up...?{narratoroff}
}

talk Deco@Fallback@Talk
{
	{narrator}The tag is still on it...{narratoroff}
}

talk Deco@Fallback@Talk
{
	{narrator}Looks kind of cheap...{narratoroff}
}

talk Deco@Fallback@Talk
{
	{narrator}... Is this a fake?{narratoroff}
}

talk Deco@Fallback@Talk
{
	{narrator}Somehow, this takes up much more space than it should...{narratoroff}
}


//———————————————————— Deco close by menu ————————————————————
talk Deco@Fallback@Close
{
	\s[-1]{narrator}Pack that up...{narratoroff}
}

talk Deco@Fallback@Close
{
	\s[-1]{narrator}Let's just put that out of sight while she isn't looking...{narratoroff}
}

talk Deco@Fallback@Close
{
	\s[-1]{narrator}One less thing to put away later...{narratoroff}
}

talk Deco@Fallback@Close
{
	\s[-1]\0\s[away]... \w8\w8\s[annoyed]\f[italic,1]Fine\f[italic,default]. \s[eyeroll]\i[10]I'll need that space for something bigger later anyway.
}


//———————————————————— Deco pet close ————————————————————
talk Deco@Fallback@PetClose(p)
{
	\s[anger]Stop putting your hands on everything! \p[{p}]\s[-1]\0\s[eyeroll]\i[10]I'll have to get a replacement, ugh.
}

talk Deco@Fallback@PetClose(p)
{
	\s[anger]Don't get my decorations all gross with your fingerprints! \p[{p}]\s[-1]\0\s[eyeroll]\i[10]Ugh, whatever, I'll just put something else here.
}

talk Deco@Fallback@PetClose(p)
{
	\s[annoyed]You're ruining my decorations! \s[anger]Look how nasty it is with your grubby hand marks on it! \p[{p}]\s[-1]\0\s[eyeroll]\i[10]\f[italic,1]Fine\f[italic,default], I'll just have to get something better in to replace it.
}


//———————————————————— Deco petting ————————————————————
talk Deco@Fallback@Pet
{
	\s[annoyed]Keep your hands to yourself!
}

talk Deco@Fallback@Pet
{
	\s[annoyed]Ew, don't put your hands all over that!
}

talk Deco@Fallback@Pet
{
	\s[annoyed]Stop touching my decorations, you're getting them all grubby!
}

talk Deco@Fallback@Pet
{
	\s[annoyed]Get your oily fingers off my party decor!
}

talk Deco@Fallback@Pet
{
	\s[annoyed]Cut that out, I have it set up all nice and you're going to ruin it!
}

talk Deco@Fallback@Pet
{
	\s[annoyed]Don't touch that, you're going to make it look gross!
}

talk Deco@Fallback@Pet
{
	\s[annoyed]Get your fingers off that, yuck!
}


//———————————————————— Needle poke ————————————————————
talk Deco@Fallback@NeedlePoke
{
	\s[anger]Stop scratching up my stuff!
}

talk Deco@Fallback@NeedlePoke
{
	\s[anger]Don't stab that!
}


//———————————————————— Needle poke close (deco) ————————————————————
talk Deco@Fallback@NeedleClose(p)
{
	\s[anger]Now look what you've done, you've totally ruined this! \p[{p}]\s[-1]\0\s[phone]I'll have to get a new one...
}


//———————————————————— Needle poke leave (guests) ————————————————————
talk Guest@Fallback@NeedleLeave
{
	...
}


//———————————————————— Cake smash (via Birthday Needle) ————————————————————
talk Deco@Fallback@GiveCake
{
	\s[anger]Don't smear cake all over that!
}

talk Deco@Fallback@GiveCake
{
	\s[anger]Eat the cake, don't get it everywhere!
}


//———————————————————— Cake close (deco) ————————————————————
talk Deco@Fallback@CakeClose(p)
{
	\s[annoyed]Great, now you've got frosting and crumbs all over this. \p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]Whatever, I'll just set it to the side and \f[italic,1]you\f[italic,default] can clean it up later.
}


//———————————————————— Give cake (guests) ————————————————————
talk Guest@Fallback@GiveCake
{
	\i[14]
}