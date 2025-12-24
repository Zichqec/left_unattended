//—————————————————————————————— Stuff shared between left and right ——————————————————————————————
//——————————————— Banners ———————————————
talk DecoLeftTalk@LeftBanner,  DecoRightTalk@RightBanner(p,text)
{
	\p[{p}]{narrator}It says "{text}"...{narratoroff}
}


//——————————————— Speakers ———————————————
talk DecoLeftTalk@LeftSpeaker,  DecoRightTalk@RightSpeaker(p)
{
	\p[{p}]{narrator}The music is so loud...{narratoroff}
}

talk DecoLeftTalk@LeftSpeaker,  DecoRightTalk@RightSpeaker(p)
{
	\p[{p}]{narrator}Music blares out of the speakers, paying no mind to the headaches it is causing in those nearby...{narratoroff}
}