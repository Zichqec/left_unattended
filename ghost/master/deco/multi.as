//—————————————————————————————— Stuff shared between left and right ——————————————————————————————
//——————————————— Banners ———————————————
talk DecoLeft@LeftBanner@Talk,  DecoRight@RightBanner@Talk(p,text)
{
	\p[{p}]{narrator}It says "{text}"...{narratoroff}
}


//——————————————— Balloons ———————————————
talk DecoLeft@LeftBalloons@Talk, DecoRight@RightBalloons@Talk, DecoBottom@BottomBalloons@Talk(p)
{
	\p[{p}]{narrator}Pockets of captive helium... a tiny enclave in an atmosphere full of nitrogen and oxygen.{narratoroff}
}

talk DecoLeft@LeftBalloons@Talk, DecoRight@RightBalloons@Talk, DecoBottom@BottomBalloons@Talk(p)
{
	\p[{p}]{narrator}Balloons never seem willing participants at parties, they always yearn to fly away...{narratoroff}
}


//——————————————— Speakers ———————————————
talk DecoLeft@LeftSpeaker@Talk,  DecoRight@RightSpeaker@Talk, DecoTop@TopSpeaker@Talk(p)
{
	\p[{p}]{narrator}The music is so loud...{narratoroff}
}

talk DecoLeft@LeftSpeaker@Talk,  DecoRight@RightSpeaker@Talk, DecoTop@TopSpeaker@Talk(p)
{
	\p[{p}]{narrator}Music blares out of the speakers, paying no mind to the headaches it is causing in those nearby...{narratoroff}
}

talk DecoLeft@LeftSpeaker@Talk,  DecoRight@RightSpeaker@Talk, DecoTop@TopSpeaker@Talk(p)
{
	\p[{p}]{narrator}Why does party music have to drone so loudly...{narratoroff}
}


//——————————————— Dart boards ———————————————
talk DecoLeft@LeftDartboard@Talk,  DecoRight@RightDartboard@Talk(p)
{
	\p[{p}]{narrator}Someone's done quite well at this.{narratoroff}
}

talk DecoLeft@LeftDartboard@Pet,  DecoRight@RightDartboard@Pet(p)
{
	\s[annoyed]Keep messing with that and we'll start using your \f[italic,1]face\f[italic,default] as a target.
}