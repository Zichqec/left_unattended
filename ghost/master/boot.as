//——————————————— Boot ———————————————
//————— Normal —————
talk BootTalk
{
	\s[0]Greetings
}

//————— Holiday —————
talk BootHolidayTalk(holiday)
{
	\s[0]Yeah yeah yeah it's {holiday}, whatever, what's more important is my party
}


//——————————————— Close failure ———————————————
//————— Items still open —————
talk CloseStillPartyingTalk
{
	Um, hello? I've got a party going here! I'm not going anywhere.
}


//————— Random failure, summons more items —————
talk CloseNotYetTalk
{
	Not so fast! I just got another shipment in! {SurfaceRefresh}Yaaaah!
}


//——————————————— Close success ———————————————
//————— Removed all items and closed —————
talk CloseCleanedUpTalk
{
	Fine!! You've RUINED my party!!!
}


//————— Pet-closed last item —————
talk CloseStopTouchingThingsTalk(p)
{
	Ew??? Stop messing up my stuff! Weirdo!!!\p[{p}]\s[-1]\0 Fine, whatever, if you're just gonna mess stuff up then I'm outta here!!!
}


//————— Give up (close all/change) —————
talk CloseDefeatTalk
{
	Heading out? We'll save you some cake lol
}


//——————————————— Other ghosts ———————————————
//————— Arrival —————
talk VIPArriveTalk(sakura)
{
	Yooo what's up {sakura}, welcome to the party
}


//————— Departure —————
talk VIPLeaveTalk(sakura)
{
	Oh, bye then, {sakura}. Stay longer next time.
}