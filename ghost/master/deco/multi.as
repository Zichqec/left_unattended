//—————————————————————————————— Stuff shared between left and right ——————————————————————————————
//——————————————— Banners ———————————————
talk DecoLeft@Talk@LeftBanner,  DecoRight@Talk@RightBanner(p,text)
{
	\p[{p}]{narrator}It says "{text}"...{narratoroff}
}


//——————————————— Speakers ———————————————
talk DecoLeft@Talk@LeftSpeaker,  DecoRight@Talk@RightSpeaker, DecoTop@Talk@TopSpeaker(p)
{
	\p[{p}]{narrator}The music is so loud...{narratoroff}
}

talk DecoLeft@Talk@LeftSpeaker,  DecoRight@Talk@RightSpeaker, DecoTop@Talk@TopSpeaker(p)
{
	\p[{p}]{narrator}Music blares out of the speakers, paying no mind to the headaches it is causing in those nearby...{narratoroff}
}