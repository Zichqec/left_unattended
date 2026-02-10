// talk DecoTop@TEMP@Talk
// {
	// {narrator}temp{narratoroff}
// }

//DecoTop@TEMP@Talk
//DecoTop@TEMP@MenuOpt
//DecoTop@TEMP@Close
//DecoTop@TEMP@Pet
//DecoTop@TEMP@PetClose
//DecoTop@TEMP@NeedlePoke
//DecoTop@TEMP@NeedleClose
//DecoTop@TEMP@GiveCake
//DecoTop@TEMP@CakeClose

//——————————————— Triangles ———————————————
talk DecoTop@TriangleString@Talk
{
	{narrator}Shiny triangles on a string... what are these things called?{narratoroff}
}

talk DecoTop@TriangleString@Talk
{
	{narrator}A bit of colorful flair...{narratoroff}
}

talk DecoTop@TriangleString@Talk
{
	{narrator}Why triangles, one has to wonder? Why not squares? Circles? Rhombuses?{narratoroff}
}


talk DecoTop@TriangleString@Pet
{
	\s[eyeroll]\i[10]Yes, yes, they're very shiny. \s[annoyed]But if you keep putting your hands all over them, they won't be anymore.
}

talk DecoTop@TriangleString@Pet
{
	\s[annoyed]Are you trying to rip the triangles off? Cut it out!
}


talk DecoTop@TriangleString@Close
{
	\s[-1]\0\s[anger]Hey! Don't just pull my triangles down, they're a pain to put up there!
}

talk DecoTop@TriangleString@Close
{
	\s[-1]\0\s[anger]Rude! Leave my triangles alone. \s[eyeroll]\i[10]What have you got against a little ceiling decoration?
}


//DecoTop@TriangleString@MenuOpt
//DecoTop@TriangleString@PetClose
//DecoTop@TriangleString@NeedlePoke
//DecoTop@TriangleString@NeedleClose
//DecoTop@TriangleString@GiveCake
//DecoTop@TriangleString@CakeClose


//——————————————— Top banner ———————————————
talk DecoTop@TopBanner@Talk
{
	{narrator}It's a bit frayed...{narratoroff}
}

talk DecoTop@TopBanner@Talk
{
	{narrator}"HAPPY PARTY", is it?{narratoroff}
}


talk DecoTop@TopBanner@Pet
{
	\s[annoyed]Stop messing with that, it was hard to hang up.
}

talk DecoTop@TopBanner@Pet
{
	\s[annoyed]Leave that alone, I have it hanging up all nice!
}


talk DecoTop@TopBanner@NeedlePoke
{
	\s[annoyed]Don't put holes in my nice banner!
}

talk DecoTop@TopBanner@NeedlePoke
{
	\s[annoyed]Stop that, don't ruin my banner!
}


talk DecoTop@TopBanner@NeedleClose(p)
{
	\s[annoyed]Great, it's full of holes now! \s[eyeroll]\i[10]So much for being reusable. \p[{p}]\s[-1]\0
	
	\s[anger]You're getting me a new one for next time.
}

//DecoTop@TopBanner@MenuOpt
//DecoTop@TopBanner@Close
//DecoTop@TopBanner@PetClose
//DecoTop@TopBanner@GiveCake
//DecoTop@TopBanner@CakeClose


//——————————————— Disco ball ———————————————
talk DecoTop@DiscoBall@Talk
{
	{narrator}It glimmers and gleams as it spins...{narratoroff}
}

talk DecoTop@DiscoBall@Talk
{
	{narrator}Shiny...{narratoroff}
}


talk DecoTop@DiscoBall@Pet
{
	\s[annoyed]If you get your handprints all over the disco ball, it's not going to be shiny anymore!
}

talk DecoTop@DiscoBall@Pet
{
	\s[annoyed]Stop messing with that disco ball, I don't have time to clean it if you get it dirty!
}


talk DecoTop@DiscoBall@PetClose(p)
{
	\s[annoyed]Now look, you've got it all gunked up with your grimy handprints. \s[eyeroll]\i[10]Just what everyone wants for a disco ball. \p[{p}]\s[-1]\0
	
	\s[anger]I'm making you clean this later until it \f[italic,1]sparkles.\f[italic,default]
}


talk DecoTop@DiscoBall@GiveCake
{
	\s[annoyed]Don't smear cake on the disco ball, it won't work anymore!
}

talk DecoTop@DiscoBall@GiveCake
{
	\s[annoyed]Stop that, don't smear cake all over my nice disco ball!
}


talk DecoTop@DiscoBall@CakeClose(p)
{
	\s[annoyed]Great, you've turned it into a cake ball. \s[eyeroll]\i[10]Brilliant. \p[{p}]\s[-1]\0
	
	\s[annoyed]Well, after this party is over, you can spend lots of time with your new "cake ball"... \s[anger]cleaning every speck of cake off of it until it gleams.
}

//DecoTop@DiscoBall@MenuOpt
//DecoTop@DiscoBall@Close
//DecoTop@DiscoBall@NeedlePoke
//DecoTop@DiscoBall@NeedleClose


//——————————————— Light string ———————————————
talk DecoTop@TopLightString@Talk
{
	{narrator}If you squint and tilt your head a little, they look like terrifyingly huge lightning bugs...{narratoroff}
}

talk DecoTop@TopLightString@Talk
{
	{narrator}Tiny, burning suns, stabbing into the retinas of onlookers...{narratoroff}
}

talk DecoTop@TopLightString@Talk
{
	{narrator}A string of headache-intensifiers...{narratoroff}
}


talk DecoTop@TopLightString@Pet
{
	\s[anger]They zapped me when I put them up there. I hope they zap you too for messing with my hard work!
}

talk DecoTop@TopLightString@Pet
{
	\s[anger]Don't pull my lights down, they give your livingroom a nice ambiance!
}


talk DecoTop@TopLightString@PetClose(p)
{
	\p[{p}]\s[-1]\0\s[anger]Great. It's a little more boring in here now. \s[eyeroll]\i[10]Hope you're happy.
}

//DecoTop@TopLightString@MenuOpt
//DecoTop@TopLightString@Close
//DecoTop@TopLightString@NeedlePoke
//DecoTop@TopLightString@NeedleClose
//DecoTop@TopLightString@GiveCake
//DecoTop@TopLightString@CakeClose


//——————————————— Speaker ———————————————

//DecoTop@TopSpeaker@Talk
//DecoTop@TopSpeaker@MenuOpt
//DecoTop@TopSpeaker@Close
//DecoTop@TopSpeaker@Pet
//DecoTop@TopSpeaker@PetClose
//DecoTop@TopSpeaker@NeedlePoke
//DecoTop@TopSpeaker@NeedleClose
//DecoTop@TopSpeaker@GiveCake
//DecoTop@TopSpeaker@CakeClose
