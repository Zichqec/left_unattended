// talk DecoFree@Talk@happypartybanner(p)
// {
	// \p[{p}]{narrator}temp{narratoroff}
// }

//——————————————— Cakes ———————————————
talk DecoFree@Talk@TieredCake, DecoFree@Talk@SlicedCake(p)
{
	\p[{p}]{narrator}Sugary frosting...{narratoroff}
}

talk DecoFree@Talk@TieredCake, DecoFree@Talk@SlicedCake(p)
{
	\p[{p}]{narrator}Looks tasty...{narratoroff}
}

talk DecoFree@Talk@TieredCake, DecoFree@Talk@SlicedCake(p)
{
	\p[{p}]{narrator}Tempting...{narratoroff}
}


talk DecoFree@Pet@TieredCake, DecoFree@Pet@SlicedCake(p)
{
	\s[anger]Don't stick your hands in the frosting!
}

talk DecoFree@Pet@TieredCake, DecoFree@Pet@SlicedCake(p)
{
	\s[annoying]Stop snitching frosting, just have a slice!
}

talk DecoFree@Pet@TieredCake, DecoFree@Pet@SlicedCake(p)
{
	\s[anger]Don't touch the cake with your hands, nasty!
}


talk DecoFree@PetClose@TieredCake, DecoFree@PetClose@SlicedCake(p)
{
	\s[annoyed]Ew, ew ew ew! \s[anger]Nobody's going to want to eat this cake now that you've stuck your hands all over it!\p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]I guess I'll have to get another one. Ugh...
}


//——————————————— Bouncy castle ———————————————
talk DecoFree@Talk@BouncyCastle(p)
{
	\p[{p}]{narrator}A plastic palace, an air-filled throne...{narratoroff}
}


//——————————————— Snack tables ———————————————
talk DecoFree@Pet@SnackTable(p)
{
	\s[annoyed]If you want some food, just grab it, don't touch everything on the table!
}

talk DecoFree@Pet@SnackTable(p)
{
	\s[eyeroll]\i[10]You can \f[italic,1]have\f[italic,default] some snacks, just don't touch food that you're not going to eat, thank you!
	
	\s[phone]Sheesh, it's common sense...
}


talk DecoFree@PetClose@SnackTable(p)
{
	\s[annoyed]Ugh, you've touched everything on there... \s[anger]Fine then, I'm putting this in the other room and you can have it all to yourself later.\p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]The snacks are for everyone, so maybe think before you touch stuff, yeah?
}


//——————————————— Plants ———————————————
talk DecoFree@Talk@PottedFern(p)
{
	\p[{p}]{narrator}Fresh greenery.{narratoroff}
}

talk DecoFree@Talk@PottedFern(p)
{
	\p[{p}]{narrator}A splash of green in a room of sickly colors...{narratoroff}
}

talk DecoFree@Talk@PottedFern(p)
{
	\p[{p}]{narrator}Dutifully replenishing the room's oxygen supply.{narratoroff}
}

talk DecoFree@Talk@PottedFern(p)
{
	\p[{p}]{narrator}... This one appears to be made of plastic.{narratoroff}
}