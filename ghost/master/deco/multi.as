//—————————————————————————————— Stuff shared between left and right ——————————————————————————————
// talk DecoFree@TEMP@Talk
// {
	// {narrator}temp{narratoroff}
// }

//DecoLeft@TEMP@Talk
//DecoLeft@TEMP@MenuOpt
//DecoLeft@TEMP@Close
//DecoLeft@TEMP@Pet
//DecoLeft@TEMP@PetClose
//DecoLeft@TEMP@NeedlePoke
//DecoLeft@TEMP@NeedleClose
//DecoLeft@TEMP@GiveCake
//DecoLeft@TEMP@CakeClose

//——————————————— Banners ———————————————
talk DecoLeft@SideBanner@Talk,  DecoRight@SideBanner@Talk(text)
{
	{narrator}It says "{text}"...{narratoroff}
}

talk DecoLeft@SideBanner@Talk,  DecoRight@SideBanner@Talk(text)
{
	{narrator}A custom printed banner that says "{text}"...{narratoroff}
}

talk DecoLeft@SideBanner@Talk,  DecoRight@SideBanner@Talk(text)
{
	{narrator}"{text}"... sure...{narratoroff}
}


talk DecoLeft@SideBanner@CAKE_TIME@Talk,  DecoRight@SideBanner@CAKE_TIME@Talk(text)
{
	{narrator}"{text}"... very true.{narratoroff}
}

talk DecoLeft@SideBanner@CAKE_TIME@Talk,  DecoRight@SideBanner@CAKE_TIME@Talk(text)
{
	{narrator}Indeed, it is "{text}"...{narratoroff}
}

talk DecoLeft@SideBanner@CAKE_TIME@Talk,  DecoRight@SideBanner@CAKE_TIME@Talk(text)
{
	{narrator}It says "{text}"... it is correct.{narratoroff}
}



talk DecoLeft@SideBanner@CAKE_TIME@Close,  DecoRight@SideBanner@CAKE_TIME@Close(p)
{
	\s[-1]\0\s[annoyed]Really? I got a banner with your favorite thing on it, and you pulled it down anyway?
	
	\s[eyeroll]\i[10]Fine, whatever. Go put it in your room or something if you're that desperate to have it before the party is over.
}


talk DecoLeft@SideBanner@NeedlePoke, DecoRight@SideBanner@NeedlePoke
{
	\s[annoyed]Don't poke holes in my nice banner!
}

talk DecoLeft@SideBanner@NeedlePoke, DecoRight@SideBanner@NeedlePoke
{
	\s[annoyed]Stop ruining that, I had it custom printed!
}

talk DecoLeft@SideBanner@NeedlePoke, DecoRight@SideBanner@NeedlePoke
{
	\s[annoyed]Cut that out, you're putting holes in it!
}


talk DecoLeft@SideBanner@NeedleClose, DecoRight@SideBanner@NeedleClose(p)
{
	\s[anger]Great, now what am I supposed to do with this? \s[eyeroll]\i[10]What good is a banner if it's peppered with holes? \p[{p}]\s[-1]\0
	
	\s[phone]Whatever, I'll order another one. \s[annoyed]Don't destroy it this time. \s[anger]Also, you're paying for the replacement.
}


talk DecoLeft@SideBanner@CAKE_TIME@GiveCake,  DecoRight@SideBanner@CAKE_TIME@GiveCake
{
	\s[eyeroll]\i[10]Oh come on, don't smear cake on that!
}

talk DecoLeft@SideBanner@CAKE_TIME@GiveCake,  DecoRight@SideBanner@CAKE_TIME@GiveCake
{
	\s[annoyed]"Cake time" as in \f[italic,1]eat some cake at the party,\f[italic,default] not as in \f[italic,1]smear some cake on this banner.\f[italic,default]
}


talk DecoLeft@SideBanner@CAKE_TIME@CakeClose,  DecoRight@SideBanner@CAKE_TIME@CakeClose(p)
{
	\s[annoyed]You have got to be kidding me. \s[eyeroll]I went to all the effort of getting a banner \i[10]\f[italic,1]specifically\f[italic,default] to placate you and bring you enjoyment, and you made a mess of it. \p[{p}]\s[-1]\0
	
	\s[annoyed]Fine, whatever. This is going in your room, it's my gift to you. \s[anger]I hope you get ants.
}

//DecoLeft@SideBanner@MenuOpt
//DecoLeft@SideBanner@Pet
//DecoLeft@SideBanner@PetClose


//——————————————— Balloons ———————————————
talk DecoLeft@SideBalloons@Talk, DecoRight@SideBalloons@Talk, DecoBottom@BottomBalloons@Talk
{
	{narrator}Pockets of captive helium... a tiny enclave in an atmosphere full of nitrogen and oxygen.{narratoroff}
}

talk DecoLeft@SideBalloons@Talk, DecoRight@SideBalloons@Talk, DecoBottom@BottomBalloons@Talk
{
	{narrator}Balloons never seem willing participants at parties, they always yearn to fly away...{narratoroff}
}


talk DecoLeft@SideBalloons@Pet, DecoRight@SideBalloons@Pet, DecoBottom@BottomBalloons@Pet
{
	\s[annoyed]Are you trying to build up a static charge?
}

talk DecoLeft@SideBalloons@Pet, DecoRight@SideBalloons@Pet, DecoBottom@BottomBalloons@Pet
{
	\s[annoyed]Quit rubbing those!
}


talk DecoLeft@SideBalloons@PetClose, DecoRight@SideBalloons@PetClose, DecoBottom@BottomBalloons@PetClose(p)
{
	\s[anger]No way, I'm not having you go around zapping my guests. \p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]Be nice to our company, thanks.
}

talk DecoLeft@SideBalloons@PetClose, DecoRight@SideBalloons@PetClose, DecoBottom@BottomBalloons@PetClose(p)
{
	\s[anger]That's enough of that, I'm not letting you go around and shock people. \p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]Sheesh, I just wanted to have some colorful balloons...
}


talk DecoLeft@SideBalloons@NeedlePoke, DecoRight@SideBalloons@NeedlePoke, DecoBottom@BottomBalloons@NeedlePoke
{
	\s[annoyed]Don't swing that around near the balloons, you'll pop them!
}

talk DecoLeft@SideBalloons@NeedlePoke, DecoRight@SideBalloons@NeedlePoke, DecoBottom@BottomBalloons@NeedlePoke
{
	\s[annoyed]Cut it out, you're going to pop the balloons if you keep doing that!
}

talk DecoLeft@SideBalloons@NeedlePoke, DecoRight@SideBalloons@NeedlePoke, DecoBottom@BottomBalloons@NeedlePoke
{
	\s[annoyed]Don't do that, you're going to pop the balloons!
}

talk DecoLeft@SideBalloons@NeedlePoke, DecoRight@SideBalloons@NeedlePoke, DecoBottom@BottomBalloons@NeedlePoke
{
	\s[annoyed]You're going to pop the balloons, stop doing that!
}


//I wouldn't usually comment on real world events like the helium shortage in ghost dialogue, but... the sheer terribleness of this comment was too good to pass up lol
talk DecoLeft@SideBalloons@NeedleClose, DecoRight@SideBalloons@NeedleClose, DecoBottom@BottomBalloons@NeedleClose(p)
{
	\s[away]\p[{p}]\s[-1]\f[italic,1]Pop.\f[italic,default]\w8\w8\0.\w8.\w8. \w8\w8\s[annoyed]What did I tell you. \s[anger]Thanks for that, now I'll have to get some more.
	
	\s[eyeroll]\i[10]Sheesh, there's a helium shortage and everything, and this is what you do.
}

//DecoLeft@SideBalloons@MenuOpt
//DecoLeft@SideBalloons@Close
//DecoLeft@SideBalloons@GiveCake
//DecoLeft@SideBalloons@CakeClose



//——————————————— Speakers ———————————————
talk DecoLeft@SideSpeaker@Talk,  DecoRight@SideSpeaker@Talk, DecoTop@TopSpeaker@Talk
{
	{narrator}The music is so loud...{narratoroff}
}

talk DecoLeft@SideSpeaker@Talk,  DecoRight@SideSpeaker@Talk, DecoTop@TopSpeaker@Talk
{
	{narrator}Music blares out of the speakers, paying no mind to the headaches it is causing in those nearby...{narratoroff}
}

talk DecoLeft@SideSpeaker@Talk,  DecoRight@SideSpeaker@Talk, DecoTop@TopSpeaker@Talk
{
	{narrator}Why does party music have to drone so loudly...{narratoroff}
}


talk DecoLeft@SideSpeaker@NeedlePoke, DecoRight@SideSpeaker@NeedlePoke, DecoTop@TopSpeaker@NeedlePoke
{
	\s[annoyed]Don't poke stuff into the speaker! You're going to ruin it!
}

talk DecoLeft@SideSpeaker@NeedlePoke, DecoRight@SideSpeaker@NeedlePoke, DecoTop@TopSpeaker@NeedlePoke
{
	\s[annoyed]Cut that out, you'll ruin the sound!
}

talk DecoLeft@SideSpeaker@NeedlePoke, DecoRight@SideSpeaker@NeedlePoke, DecoTop@TopSpeaker@NeedlePoke
{
	\s[annoyed]Stop that, speakers are \f[italic,1]delicate!\f[italic,default]
}


talk DecoLeft@SideSpeaker@NeedleClose, DecoRight@SideSpeaker@NeedleClose, DecoTop@TopSpeaker@NeedleClose(p)
{
	\s[anger]Great, you've ruined it! \s[eyeroll]\i[10]Speakers don't work if you poke holes in them, you know! \p[{p}]\s[-1]\0
	
	\s[annoyed]You probably did know that. \s[anger]You owe me a new speaker after this party wraps up.
}


talk DecoLeft@SideSpeaker@GiveCake, DecoRight@SideSpeaker@GiveCake, DecoTop@TopSpeaker@GiveCake
{
	\s[annoyed]Don't shove cake in there, gross!
}

talk DecoLeft@SideSpeaker@GiveCake, DecoRight@SideSpeaker@GiveCake, DecoTop@TopSpeaker@GiveCake
{
	\s[annoyed]Stop that, don't get frosting in the speaker! Nasty!
}

talk DecoLeft@SideSpeaker@GiveCake, DecoRight@SideSpeaker@GiveCake, DecoTop@TopSpeaker@GiveCake
{
	\s[annoyed]Don't do that, you're going to ruin the sound!
}

talk DecoLeft@SideSpeaker@GiveCake, DecoRight@SideSpeaker@GiveCake, DecoTop@TopSpeaker@GiveCake
{
	\s[annoyed]Ew, don't ruin my speakers!
}


talk DecoLeft@SideSpeaker@CakeClose, DecoRight@SideSpeaker@CakeClose, DecoTop@TopSpeaker@CakeClose(p)
{
	\s[annoyed]Yuck! You've gotten cake all through there! \p[{p}]\s[-1]\0
	
	\s[anger]Cake and speakers don't mix. Stop making a mess!
}

talk DecoLeft@SideSpeaker@CakeClose, DecoRight@SideSpeaker@CakeClose, DecoTop@TopSpeaker@CakeClose(p)
{
	\s[annoyed]Now look what you've done, that speaker is ruined! \p[{p}]\s[-1]\0
	
	\s[anger]Disgusting, you're the worst. \s[phone]I'm going to order a new speaker and put it on \f[italic,1]your\f[italic,default] credit card.
}


//DecoLeft@SideSpeaker@MenuOpt
//DecoLeft@SideSpeaker@Close
//DecoLeft@SideSpeaker@Pet
//DecoLeft@SideSpeaker@PetClose



//——————————————— Dart boards ———————————————
talk DecoLeft@SideDartboard@Talk,  DecoRight@SideDartboard@Talk
{
	{narrator}Someone's done quite well at this.{narratoroff}
}

talk DecoLeft@SideDartboard@Talk,  DecoRight@SideDartboard@Talk
{
	{narrator}Is anyone actually playing, or did she set up the darts in a pre-determined pattern for the "aesthetic"...?{narratoroff}
}

talk DecoLeft@SideDartboard@Talk,  DecoRight@SideDartboard@Talk
{
	{narrator}The darts appear to be glued in place.{narratoroff}
}


talk DecoLeft@SideDartboard@MenuOpt,  DecoRight@SideDartboard@MenuOpt
{
	\![*]\__q[OnDartboard@ThrowDart]Throw a dart\__q\n\n
}

talk OnDartboard@ThrowDart
{
	\s[tongue]Nice throw.
}

talk OnDartboard@ThrowDart
{
	\s[tongue]Not bad.
}

talk OnDartboard@ThrowDart
{
	\s[tongue]That's the way to do it.
}

talk OnDartboard@ThrowDart
{
	\s[tongue]Yeah, keep playing with that. \s[laugh]See? My parties are fun.
}


talk DecoLeft@SideDartboard@Pet,  DecoRight@SideDartboard@Pet
{
	\s[annoyed]Keep messing with that and we'll start using your \f[italic,1]face\f[italic,default] as a target.
}

talk DecoLeft@SideDartboard@Pet,  DecoRight@SideDartboard@Pet
{
	\s[annoyed]Don't mess up someone else's game of darts! \s[eyeroll]\i[10]\f[italic,1]So\f[italic,default] rude.
}


talk DecoLeft@SideDartboard@PetClose,  DecoRight@SideDartboard@PetClose(p)
{
	\s[annoyed]Great, how can anyone continue this game now? You've shuffled all the darts up! \p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]Whatever, I'll just put it in the kitchen until someone else wants to play. \s[anger]Next time be considerate of other people.
}


talk DecoLeft@SideDartboard@NeedlePoke,  DecoRight@SideDartboard@NeedlePoke
{
	\s[annoyed]That's not a dart, stop doing that!
}

talk DecoLeft@SideDartboard@NeedlePoke,  DecoRight@SideDartboard@NeedlePoke
{
	\s[annoyed]You can't just walk up to the dartboard and shove something pointy in, that's not how darts is played!
}

talk DecoLeft@SideDartboard@NeedlePoke,  DecoRight@SideDartboard@NeedlePoke
{
	\s[annoyed]That's cheating, you have to throw your dart from a distance if you want it to count!
	
	\s[eyeroll]It has to be an actual \f[italic,1]dart\f[italic,default] too, \i[10]not just some pointy thing you found.
}


talk DecoLeft@SideDartboard@NeedleClose,  DecoRight@SideDartboard@NeedleClose(p)
{
	\s[annoyed]Enough, if you're just going to cheat then I'm taking this down! \p[{p}]\s[-1]\0
	
	\s[anger]I hope you're happy, you've ruined the game for everyone.
}


//DecoLeft@SideDartboard@MenuOpt
//DecoLeft@SideDartboard@Close
//DecoLeft@SideDartboard@GiveCake
//DecoLeft@SideDartboard@CakeClose
