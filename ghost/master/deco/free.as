// talk DecoFree@TEMP@Talk
// {
	// {narrator}temp{narratoroff}
// }

//DecoFree@TEMP@Talk
//DecoFree@TEMP@MenuOpt
//DecoFree@TEMP@Close
//DecoFree@TEMP@Pet
//DecoFree@TEMP@PetClose
//DecoFree@TEMP@NeedlePoke
//DecoFree@TEMP@NeedleClose
//DecoFree@TEMP@GiveCake
//DecoFree@TEMP@CakeClose

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


talk DecoFree@TieredCake@MenuOpt, DecoFree@SlicedCake@MenuOpt(p)
{
	\![*]\__q[OnCakeAction@AdmireFrosting,{p}]Admire the frosting\__q\n\n
}

talk OnCakeAction@AdmireFrosting
{
	\p[{Shiori.Reference[0]}]{narrator}So smooth...{narratoroff}
}

talk OnCakeAction@AdmireFrosting
{
	\p[{Shiori.Reference[0]}]{narrator}Looks sweet...{narratoroff}
}

talk OnCakeAction@AdmireFrosting
{
	\p[{Shiori.Reference[0]}]{narrator}Unbearably tasty-looking...{narratoroff}
}

talk OnCakeAction@AdmireFrosting
{
	\p[{Shiori.Reference[0]}]{narrator}Pretty colors...{narratoroff}
}


talk DecoFree@TieredCake@MenuOpt, DecoFree@SlicedCake@MenuOpt(p)
{
	\![*]\__q[OnCakeAction@EatSlice,{p}]Eat a slice\__q\n\n
}


function OnCakeAction@EatSlice
{
	local pick = Shiori.Reference[0];
	PartyClutter[pick].slicesleft--; //This is the moment I realized you don't have to be inside the object to manipulate the variables of each instance... all for some cake lol
	
	if (PartyClutter[pick].slicesleft < 0)
	{
		PartyClutter.Remove["{pick}"];
		
		local output = "\p[{pick}]\s[-1]";
		output += OnCakeAction@EatSlice@Nom(pick) + "\n\n[half]\w8\w8\w8\w8\0";
		output += OnCakeAction@EatSlice@AllGone(pick);
		
		return output;
	}
	else return OnCakeAction@EatSlice@Nom(pick);
}

talk OnCakeAction@EatSlice@AllGone
{
	\s[away].\w8.\w8. \s[annoyed]Did you just eat... that \f[italic,1]whole\f[italic,default] cake??\n\n[half]\w8\w8\p[{Shiori.Reference[0]}]{narrator}Oops... {narratoroff}\0\s[anger]I can't believe you. Now what is everyone else supposed to eat! \s[eyeroll]\i[10]Ugh, I'll have to order something else...
}

talk OnCakeAction@EatSlice@AllGone
{
	\s[annoyed]Did you just eat an entire cake \f[italic,1]yourself?\f[italic,default]\w8\w8\n\n[half]\p[{Shiori.Reference[0]}]{narrator}Uh oh... {narratoroff}\0\s[anger]Come on, save some for later at least! \s[eyeroll]\i[10]You're going to eat us out of house and home!
}


talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}Yum...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}Delicious...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}Sugary goodness...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}Maybe the parties are worth it...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}Incredibly good...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}Sweet and soft...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}Amazingly tasty...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}Heavenly...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}Indescribably satisfying...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}The perfect dessert experience...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}Even better than it looks, and it looks great...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}Phenomenal...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}Good flavor... good texture...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}Unrivaled dessert king...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}So good...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}Excellent balance of frosting and cake...{narratoroff}
}

talk OnCakeAction@EatSlice@Nom
{
	\p[{Shiori.Reference[0]}]{narrator}How can anyone possibly resist...{narratoroff}
}


talk DecoFree@TieredCake@MenuOpt, DecoFree@SlicedCake@MenuOpt(p)
{
	\![*]\__q[OnCakeAction@BlowOutCandles,{p}]Blow out the candles\__q\n\n
}

talk OnCakeAction@BlowOutCandles
{
	\s[forward]They're fake. \s[eyeroll]\i[10]I figured you'd probably do that and try to ruin the lit candle aesthetic I have going on. \p[{Shiori.Reference[0]}]{narrator}Criminal...{narratoroff}
}


talk DecoFree@TieredCake@MenuOpt, DecoFree@SlicedCake@MenuOpt(p)
{
	\![*]\__q[OnCakeAction@TakePicture,{p}]Take a picture\__q\n\n
}

talk OnCakeAction@TakePicture
{
	\p[{Shiori.Reference[0]}]{narrator}Who says you can't have your cake and eat it too...{narratoroff}
}

talk OnCakeAction@TakePicture
{
	\p[{Shiori.Reference[0]}]{narrator}This will be great to frame and hang on the wall later...{narratoroff}
}

talk OnCakeAction@TakePicture
{
	\p[{Shiori.Reference[0]}]{narrator}Too perfect not to save...{narratoroff}
}


//TODO This one is in an awkward format for now because the scope switch line breaks aren't playing nice with the \p[] tags for some reason. Change later if this gets adjusted
talk DecoFree@TieredCake@Close, DecoFree@SlicedCake@Close
{
	{narrator}Save that for later... \n\n\0\s[anger]Hey! Where are you carting that cake off to!? \n\n\p[{p}]Oops... {narratoroff}\0\s[eyeroll]\i[10]Ugh, I should have known. \s[phone]Whatever.
}

talk DecoFree@TieredCake@Close, DecoFree@SlicedCake@Close
{
	{narrator}Just set that off to the side... \n\n\0\s[annoyed]... I knew you'd do that. \n\n\p[{p}]Whoops... {narratoroff}\0\s[eyeroll]\i[10]You and your cake. \s[phone]Whatever.
}

talk DecoFree@TieredCake@Close, DecoFree@SlicedCake@Close
{
	{narrator}Slide that into the kitchen, nobody will notice... \n\n\0\s[annoyed]... \n\n\p[{p}]... Someone noticed. {narratoroff}\0\s[eyeroll]\i[10]Should I even dignify this with a comment.
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


talk DecoFree@TieredCake@NeedlePoke, DecoFree@SlicedCake@NeedlePoke
{
	\s[annoyed]Just take a slice, don't tear the whole cake up!
}

talk DecoFree@TieredCake@NeedlePoke, DecoFree@SlicedCake@NeedlePoke
{
	\s[annoyed]Stop poking holes in the frosting, just have some!
}

talk DecoFree@TieredCake@NeedlePoke, DecoFree@SlicedCake@NeedlePoke
{
	\s[annoyed]Are you hiding sharp objects in the cake? \s[anger]Are you trying to get someone hurt??
}

talk DecoFree@TieredCake@NeedlePoke, DecoFree@SlicedCake@NeedlePoke
{
	\s[annoyed]What are you doing to that cake!?
}


talk DecoFree@TieredCake@NeedleClose, DecoFree@SlicedCake@NeedleClose(p)
{
	\s[annoyed]... Great. \s[anger]Great! \s[eyeroll]\i[10]I can't let anyone else eat this cake now, thanks to you. \p[{p}]\s[-1]\0
	
	\s[anger]This one is going in the trash. \w8\w8\s[phone]\w8\w8\w8\w8\w8\s[away].\w8.\w8. \s[annoyed]I better not see you pulling it back \f[italic,1]out\f[italic,default] of the trash later.
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


talk DecoFree@PottedFern@GiveCake
{
	\s[annoyed]Stop that, plants don't eat cake.
}

talk DecoFree@PottedFern@GiveCake
{
	\s[annoyed]Plants eat \f[italic,1]carbon dioxide\f[italic,default], not cake. \s[eyeroll]\i[10]If you cover it in cake you're going to smother it.
}

talk DecoFree@PottedFern@GiveCake
{
	\s[annoyed]If you want to help the plant, maybe \f[italic,1]water\f[italic,default] it, don't smear cake all over it.
}


talk DecoFree@PottedFern@CakeClose(p)
{
	\s[annoyed]... Are you trying to kill my plants? \s[eyeroll]\i[10]Ugh, I'd better put this in the kitchen before it's unsalvageable. \p[{p}]\s[-1]\0
	
	\s[anger]Not every living being likes or can eat cake, you know.
}


//DecoFree@PottedFern@MenuOpt
//DecoFree@PottedFern@Close
//DecoFree@PottedFern@Pet
//DecoFree@PottedFern@PetClose
//DecoFree@PottedFern@NeedlePoke
//DecoFree@PottedFern@NeedleClose


//——————————————— Bouncy castle ———————————————
talk DecoFree@BouncyCastle@Talk
{
	{narrator}A plastic palace, an air-filled throne...{narratoroff}
}

talk DecoFree@BouncyCastle@Talk
{
	{narrator}Pretend walls for pretend royalty...{narratoroff}
}

talk DecoFree@BouncyCastle@Talk
{
	{narrator}It's not even a complete castle, just the outward appearance of one. How sad...{narratoroff}
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
	\s[annoyed]Well, now look what you've done, it's completely ruined. \p[{p}]\s[-1]\0\s[eyeroll]\i[10]Ugh, and after I spent all that time getting the fan working, too.
	
	\s[away]I'll have to get another one to replace it... \s[tongue]Maybe I'll get the bigger size this time.
}


talk DecoFree@BouncyCastle@GiveCake
{
	\s[annoyed]Don't get your cake all over my castle, yuck!
}

talk DecoFree@BouncyCastle@GiveCake
{
	\s[annoyed]Are you smearing cake into the netting? That's never going to come out, stop it!
}


talk DecoFree@BouncyCastle@CakeClose(p)
{
	\s[annoyed]Great, you've ruined it. \s[anger]Fine, this is your bouncy castle now, and you owe me the money I paid for it. \p[{p}]\s[-1]\0
	
	\s[away]I'll have to find a cake-proof bouncy castle to deter you...
}


//DecoFree@BouncyCastle@MenuOpt
//DecoFree@BouncyCastle@Close
//DecoFree@BouncyCastle@Pet
//DecoFree@BouncyCastle@PetClose


//——————————————— Snack tables ———————————————
talk DecoFree@SnackTable@salad_bar@Talk
{
	{narrator}For the health conscious...{narratoroff}
}

talk DecoFree@SnackTable@salad_bar@Talk
{
	{narrator}Make-your-own salad...{narratoroff}
}

talk DecoFree@SnackTable@salad_bar@Talk
{
	{narrator}It's quite colorful, at least...{narratoroff}
}


talk DecoFree@SnackTable@bread@Talk
{
	{narrator}Bread... a sad husk of a cake that will never be. A wasted opportunity. A chance for greatness, squandered forever...{narratoroff}
}

talk DecoFree@SnackTable@bread@Talk
{
	{narrator}"Cupcakes"... hardly deserving of the name "cake".{narratoroff}
}

talk DecoFree@SnackTable@bread@Talk
{
	{narrator}Tiny impostors, trying to fool innocent partygoers into believing they are comparable to cake...{narratoroff}
}


talk DecoFree@SnackTable@Talk
{
	{narrator}Standard party fare...{narratoroff}
}

talk DecoFree@SnackTable@Talk
{
	{narrator}Refreshments for all.{narratoroff}
}


talk DecoFree@SnackTable@bread@Pet
{
	\s[annoyed]\f[italic,1]What\f[italic,default] are you doing to those cupcakes?
}

talk DecoFree@SnackTable@bread@Pet
{
	\s[annoyed]Don't stick your hands all over the bread! That's a fresh baked loaf!
}


talk DecoFree@SnackTable@drink_cups@Pet
{
	\s[annoyed]Those are \f[italic,1]not\f[italic,default] stacking cups, stop playing with them!
}

talk DecoFree@SnackTable@drink_cups@Pet
{
	\s[annoyed]Quit playing with the cups, you're going to get them all gross!
}


talk DecoFree@SnackTable@Pet
{
	\s[annoyed]If you want some food, just grab it, don't touch everything on the table!
}

talk DecoFree@SnackTable@Pet
{
	\s[eyeroll]\i[10]You can \f[italic,1]have\f[italic,default] some snacks, just don't touch food that you're not going to eat, thank you!
	
	\s[phone]Sheesh, it's common sense...
}


talk DecoFree@SnackTable@bread@Close
{
	{narrator}Destined for the trash can...{narratoroff}
}

talk DecoFree@SnackTable@bread@Close
{
	{narrator}Away with these...{narratoroff}
}


talk DecoFree@SnackTable@bread@PetClose(p)
{
	\s[annoyed]... What did the cupcakes ever do to deserve your wrath, huh? \p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]If you don't like them, leave them for other people to eat. Sheesh.
}

talk DecoFree@SnackTable@bread@PetClose(p)
{
	\s[annoyed]... That was a nice loaf of bread, and now you've touched up the whole thing with your grimy fingers. \s[anger]Gross. \p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]I'll have to put in another order at that bakery... \s[anger]Maybe if I explain what you did, they'll offer me a refund out of pity.
}


talk DecoFree@SnackTable@drink_cups@PetClose(p)
{
	\s[annoyed]You've stuck your hand into each and every one of them. Congratulations. \p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]If you're going to be gross, can you just, like... \s[anger]not. Thanks.
}


talk DecoFree@SnackTable@PetClose(p)
{
	\s[annoyed]Ugh, you've touched everything on there... \s[anger]Fine then, I'm putting this in the other room and you can have it all to yourself later. \p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]The snacks are for everyone, so maybe think before you touch stuff, yeah?
}


talk DecoFree@SnackTable@drink_cups@NeedlePoke
{
	\s[annoyed]Stop poking holes in the cups!
}

talk DecoFree@SnackTable@drink_cups@NeedlePoke
{
	\s[annoyed]Stop that, how rude! \s[eyeroll]\i[10]If someone spills punch on themselves I'm blaming \f[italic,1]you.\f[italic,default]
}


talk DecoFree@SnackTable@NeedlePoke
{
	\s[annoyed]Are you trying to hide sharp objects in the food? \s[anger]Are you hoping someone will get hurt??
}

talk DecoFree@SnackTable@NeedlePoke
{
	\s[annoyed]What are you doing with that!? Stop ruining the food!
}


talk DecoFree@SnackTable@drink_cups@NeedleClose(p)
{
	\s[anger]Great, you've put holes in all the cups. Now what, genius. \p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]I guess this is more trash to put out later. \s[anger]I'm making you carry the trash bags.
}


talk DecoFree@SnackTable@NeedleClose(p)
{
	\s[annoyed]Great. \s[anger]Now all this food is a health hazard. \s[eyeroll]\i[10]I better toss it before someone gets injured and sues. \p[{p}]\s[-1]\0
	
	\s[anger]Although I guess if anyone \f[italic,1]did\f[italic,default] sue, I'd direct them to sue \f[italic,1]you\f[italic,default] and not me.
}


talk DecoFree@SnackTable@drink_cups@GiveCake
{
	\s[annoyed]That is \f[italic,1]not\f[italic,default] how you make cupcakes!
}

talk DecoFree@SnackTable@drink_cups@GiveCake
{
	\s[annoyed]Stop filling the cups with cake, that's not a thing! Nobody wants to eat smashed up cake in a cup!!
}


talk DecoFree@SnackTable@GiveCake
{
	\s[annoyed]Stop that, don't try to squash a whole cake onto that table! It's full!
}

talk DecoFree@SnackTable@GiveCake
{
	\s[annoyed]You're getting frosting all over the other food, cut it out!
}


talk DecoFree@SnackTable@drink_cups@CakeClose(p)
{
	\s[annoyed]... I hope you're proud of yourself and your horrible creation. \s[away]I'm putting it in the kitchen, and if you want to save any of it you better take it to your room before I see it again. \p[{p}]\s[-1]\0
	
	\s[anger]Stop messing up my refreshments. The cups are for \f[italic,1]getting drinks\f[italic,default], nothing else.
}


talk DecoFree@SnackTable@CakeClose(p)
{
	\s[annoyed]Gross... everything on there is covered in cake. \s[eyeroll]\i[10]I guess I should expect nothing less from you. \p[{p}]\s[-1]\0
	
	\s[anger]Not all foods need to be cake. Leave my snacks unadulterated, thanks.
}


//DecoFree@SnackTable@MenuOpt