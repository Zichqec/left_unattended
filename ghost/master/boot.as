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
	\s[phone]Hey. I'm having a party today.
	
	\w8\s[eyeroll]No, it's not for {holiday}. \i[10]My party sense doesn't follow the calendar.
}

//TODO do we want me to change it to "merry christmas" if christmas is pulled or should I leave it. I don't think she cares about holidays lol
talk BootHolidayTalk(holiday)
{
	\s[forward]Hm? \s[eyeroll]Oh, it's you. \i[10]Happy {TrimHolidayName(holiday)} and whatnot.
	
	\s[phone]Unrelated, I'm setting up a party. \s[tongue]I think I'll go ahead and order {morestreamers}, that'll bring out the party spirit for sure.
}

//TODO clean up or move later
function OnTestBoot
{
	local holiday = Shiori.Reference[0];
	
	if (!holiday.IsNull()) return SurfaceRefresh() + BootHolidayTalk(holiday);
	else return SurfaceRefresh() + BootTalk();
}


//——————————————— Close failure ———————————————
//————— Items still open —————
talk CloseStillPartyingTalk
{
	\s[forward]Leave? \w8\s[annoyed]Seriously? \w8\s[eyeroll]\i[10]I have a party going here, in case you haven't noticed.
}

talk CloseStillPartyingTalk
{
	\s[eyeroll]Uh, \i[10]\f[italic,1]no\f[italic,default], I'm not leaving while my party is still ongoing.
}


//————— Random failure, summons more items —————
//{SurfaceRefresh} to show the items
talk CloseNotYetTalk
{
	\s[annoyed]... \w8\s[tongue]Oh, look what just showed up. {SurfaceRefresh}\s[laugh]The party's still going!
	
	\s[anger]Stop trying to ruin it, thanks.
}


//——————————————— Close success ———————————————
//————— Removed all items and closed —————
talk CloseCleanedUpTalk
{
	\s[phone]...
	
	\w8\s[away]...
	
	\w8\s[annoyed]... \w8Fine. \s[anger]Fine! \s[shout]You've \f[italic,1]ruined\f[italic,default] my party!!
	
	\s[anger]I'm leaving. Enjoy your boring, partyless livingroom.
}


//————— Pet-closed last item —————
talk CloseStopTouchingThingsTalk(p)
{
	\s[anger]Stop putting your hands all over my stuff! \p[{p}]\s[-1]\0\s[shout]Ugh, I can't deal with this anymore! If you're gonna mess everything up, then I'm leaving!!
}


//————— Give up (close all/change) —————
talk CloseDefeatTalk
{
	\s[phone]Heading out? \s[tongue]We'll be sure to save you some cake.
}

talk CloseDefeatTalk
{
	\s[phone]Hey, if you're heading out could you pick up more {soda} at the store? Thanks.
}

talk CloseDefeatTalk
{
	\s[forward]You're heading out? \s[tongue]Okay, see you later then. \s[laugh]I'm sure we'll still be partying by the time you get back.
}


//——————————————— Other ghosts ———————————————
//————— Arrival —————
talk VIPArriveTalk(sakura)
{
	\s[tongue]Yo, good to see you, {sakura}. Welcome to the party.
}

talk VIPArriveTalk(sakura)
{
	\s[tongue]Heyyy, check it out, it's {sakura}. \s[laugh]Glad you made it.
}

talk VIPArriveTalk(sakura)
{
	\s[laugh]Is that {sakura} here to swipe some cake? \s[tongue]I think it is~
}


//————— Departure —————
talk VIPLeaveTalk(sakura)
{
	\s[forward]Was that {sakura} leaving? \s[annoyed]Are you kicking my guests out?
}

talk VIPLeaveTalk(sakura)
{
	\s[annoyed]Hey, where did {sakura} go? \s[anger]Don't kick out my friends while we're trying to have a good time!
}

talk VIPLeaveTalk(sakura)
{
	\s[away]... {sakura}?
	
	\s[annoyed]What did you say? \s[anger]I hope you're not kicking my guests out.
}