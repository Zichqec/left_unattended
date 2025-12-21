//——————————————— Boot ———————————————
//————— Normal —————
talk BootTalk
{
	\s[phone]You're here early. \s[away]Can't a girl decorate your livingroom in peace?
}

talk BootTalk
{
	\s[forward]Oh good, you're here. \s[phone]I need you to take those pictures off the wall so I can put up pictures of the party girl, aka me.
}

talk BootTalk
{
	\s[forward]... \w8\w8\s[away]I see you didn't bring any \f[italic,1]party favors... \w8\w8 \f[bold,1]Again...\f[bold,default]\f[italic,default]
}

talk BootTalk
{
	\s[forward]Oh, it's just you coming home. \s[away]I suppose you want a slice of cake.
	
	\s[phone]Fine, whatever, my friends are gonna start arriving soon anyway.
}

talk BootTalk
{
	\s[phone]Oh, hey. \w8\w8I'm having a party today. \w8\w8Make sure you keep the noise down if you're going upstairs.
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