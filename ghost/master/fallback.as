//Fallback cases for when there's no special response for a particular item type or guest personality

//Shouldn't happen... depends how we build it. Either way, avoids runtime errors. You know, I could also use try/catch for this...
//———————————————————— Guests ————————————————————
talk Guest@Fallback@Talk
{
	...
}

talk Guest@Fallback@Leave
{
	...
}

talk Guest@Fallback@NeedleLeave
{
	...
}

talk Guest@Fallback@GiveCake
{
	\i[14]
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

talk Deco@Fallback@Talk
{
	{narrator}What sleazy discount party store did this come from...?{narratoroff}
}

talk Deco@Fallback@Talk
{
	{narrator}This looks like it could fall apart at any moment...{narratoroff}
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

talk Deco@Fallback@Close
{
	\s[-1]{narrator}She probably won't notice if this gets moved to the kitchen...{narratoroff}
}

talk Deco@Fallback@Close
{
	\s[-1]{narrator}Out of sight, out of mind...{narratoroff}
}

talk Deco@Fallback@Close
{
	\s[-1]{narrator}Act casual, nothing out of the ordinary...{narratoroff}
}

talk Deco@Fallback@Close
{
	\s[-1]{narrator}Just a bit of early party cleanup...{narratoroff}
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


//———————————————————— Deco Needle poke ————————————————————
talk Deco@Fallback@NeedlePoke
{
	\s[anger]Stop scratching up my stuff!
}

talk Deco@Fallback@NeedlePoke
{
	\s[anger]Don't stab that!
}

talk Deco@Fallback@NeedlePoke
{
	\s[anger]Don't scratch my decorations, I paid good money for those!
}

talk Deco@Fallback@NeedlePoke
{
	\s[anger]Cut it out, you're scratching that all up!
}

talk Deco@Fallback@NeedlePoke
{
	\s[anger]If you ruin that you're paying to replace it.
}

talk Deco@Fallback@NeedlePoke
{
	\s[anger]What's with you, stop destroying my stuff!
}


//———————————————————— Deco Needle poke close ————————————————————
talk Deco@Fallback@NeedleClose(p)
{
	\s[anger]Now look what you've done, you've totally ruined this! \p[{p}]\s[-1]\0\s[phone]I'll have to get a new one...
}

talk Deco@Fallback@NeedleClose(p)
{
	\s[anger]Great, it's covered in scratches! \p[{p}]\s[-1]\0\s[phone]Now I need to find where I got that from so I can order another... \s[eyeroll]\i[10]and maybe a backup, too.
}

talk Deco@Fallback@NeedleClose(p)
{
	\s[anger]You've scratched that all to pieces! \p[{p}]\s[-1]\0\s[phone]Well, fine, there's more where that came from. \s[annoyed]You're footing the bill.
}


//———————————————————— Deco cake smash (via Birthday Needle) ————————————————————
talk Deco@Fallback@GiveCake
{
	\s[anger]Don't smear cake all over that!
}

talk Deco@Fallback@GiveCake
{
	\s[anger]Eat the cake, don't get it everywhere!
}

talk Deco@Fallback@GiveCake
{
	\s[anger]Stop smudging cake on that!
}

talk Deco@Fallback@GiveCake
{
	\s[anger]Gross, don't get my decorations all cakey!
}

talk Deco@Fallback@GiveCake
{
	\s[anger]Cake goes in your mouth, not on my party decorations!
}

talk Deco@Fallback@GiveCake
{
	\s[anger]Stop it, you're making a mess with that frosting!
}


//———————————————————— Deco cake close ————————————————————
talk Deco@Fallback@CakeClose(p)
{
	\s[annoyed]Great, now you've got frosting and crumbs all over this. \p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]Whatever, I'll just set it to the side and \f[italic,1]you\f[italic,default] can clean it up later.
}

talk Deco@Fallback@CakeClose(p)
{
	\s[annoyed]Wonderful, a cake special. \s[eyeroll]\i[10]Just what everyone wanted. \p[{p}]\s[-1]\0
	
	\s[annoyed]I'm making you clean that up once this party is done. \s[anger]I want it spotless so I can return it for a refund.
}

talk Deco@Fallback@CakeClose(p)
{
	\s[annoyed].\w8.\w8. \w8\w8Not everyone wants their stuff covered in cake, you know. \p[{p}]\s[-1]\0
	
	\s[away]Once this party is over, you're cleaning all the cake off of everything in this room. \s[anger]Every last speck of it.
}