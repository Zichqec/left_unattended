// talk DecoFree@happypartybanner@Talk
// {
	// {narrator}temp{narratoroff}
// }
/*
talk DecoFree@TEMP@Talk
talk DecoFree@TEMP@MenuOpt
talk DecoFree@TEMP@Close
talk DecoFree@TEMP@Pet
talk DecoFree@TEMP@PetClose
talk DecoFree@TEMP@NeedlePoke
talk DecoFree@TEMP@NeedleClose
talk DecoFree@TEMP@GiveCake
talk DecoFree@TEMP@CakeClose
*/


//——————————————— Cakes ———————————————
talk DecoFree@TieredCake@Talk, DecoFree@SlicedCake@Talk
{
	{narrator}Sugary frosting...{narratoroff}
}

talk DecoFree@TieredCake@Talk, DecoFree@SlicedCake@Talk
{
	{narrator}Looks tasty...{narratoroff}
}

talk DecoFree@TieredCake@Talk, DecoFree@SlicedCake@Talk
{
	{narrator}Tempting...{narratoroff}
}


talk DecoFree@TieredCake@Pet, DecoFree@SlicedCake@Pet
{
	\s[anger]Don't stick your hands in the frosting!
}

talk DecoFree@TieredCake@Pet, DecoFree@SlicedCake@Pet
{
	\s[annoying]Stop snitching frosting, just have a slice!
}

talk DecoFree@TieredCake@Pet, DecoFree@SlicedCake@Pet
{
	\s[anger]Don't touch the cake with your hands, nasty!
}


talk DecoFree@TieredCake@PetClose, DecoFree@SlicedCake@PetClose(p)
{
	\s[annoyed]Ew, ew ew ew! \s[anger]Nobody's going to want to eat this cake now that you've stuck your hands all over it!\p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]I guess I'll have to get another one. Ugh...
}


talk DecoFree@TieredCake@GiveCake, DecoFree@SlicedCake@GiveCake
{
	\s[anger]Stop smooshing the cakes together, you're going to mix the flavors!
}

talk DecoFree@TieredCake@GiveCake, DecoFree@SlicedCake@GiveCake
{
	\s[anger]Cut it out, you have cake in your hands, don't mess up the one on the table!
}

talk DecoFree@TieredCake@GiveCake, DecoFree@SlicedCake@GiveCake
{
	\s[anger]Isn't one cake at a time enough for you!?
}


talk DecoFree@TieredCake@CakeClose, DecoFree@SlicedCake@CakeClose(p)
{
	\s[annoyed]Ughhh, now look what you've done! You've ruined this whole cake by smearing crumbs and frosting from a different cake all over it. I thought you \f[italic,1]liked\f[italic,default] cake!
	
	\s[eyeroll]\i[10]Whatever, we can't use this anymore, so I'll \p[{p}]\s[-1]\0put it in the kitchen for now...
	
	\s[away]... \w8\w8Unless... \s[eyeroll]this was your master plan all along, to make it so nobody but you would want to eat this cake...
	
	\s[annoyed]You really know no bounds when it comes to cake, do you. \s[anger]Weirdo.
}


//——————————————— Bouncy castle ———————————————
talk DecoFree@BouncyCastle@Talk
{
	{narrator}A plastic palace, an air-filled throne...{narratoroff}
}

talk DecoFree@BouncyCastle@NeedlePoke
{
	\s[anger]Don't poke holes in my bouncy castle, all the air will come out!
}

talk DecoFree@BouncyCastle@NeedlePoke
{
	\s[anger]Stop tearing up the netting!
}

talk DecoFree@BouncyCastle@NeedleClose(p)
{
	\s[annoyed]Well, now look what you've done, it's completely ruined. \p[{p}]\s[-1]\0\s[eyeroll]\i[10]Ugh, and after I spent all that time inflating it, too.
	
	\s[away]I'll have to get another one to replace it... \s[tongue]Maybe I'll get the bigger size this time.
}


//——————————————— Snack tables ———————————————
talk DecoFree@SnackTable@Talk
{
	{narrator}Standard party fare...{narratoroff}
}

talk DecoFree@SnackTable@Talk
{
	{narrator}Refreshments for all.{narratoroff}
}

talk DecoFree@SnackTable@Pet
{
	\0\s[annoyed]If you want some food, just grab it, don't touch everything on the table!
}

talk DecoFree@SnackTable@Pet
{
	\0\s[eyeroll]\i[10]You can \f[italic,1]have\f[italic,default] some snacks, just don't touch food that you're not going to eat, thank you!
	
	\s[phone]Sheesh, it's common sense...
}


talk DecoFree@SnackTable@PetClose(p)
{
	\s[annoyed]Ugh, you've touched everything on there... \s[anger]Fine then, I'm putting this in the other room and you can have it all to yourself later.\p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]The snacks are for everyone, so maybe think before you touch stuff, yeah?
}


//——————————————— Plants ———————————————
talk DecoFree@PottedFern@Talk
{
	{narrator}Fresh greenery.{narratoroff}
}

talk DecoFree@PottedFern@Talk
{
	{narrator}A splash of green in a room of sickly colors...{narratoroff}
}

talk DecoFree@PottedFern@Talk
{
	{narrator}Dutifully replenishing the room's oxygen supply.{narratoroff}
}

talk DecoFree@PottedFern@Talk
{
	{narrator}... This one appears to be made of plastic.{narratoroff}
}