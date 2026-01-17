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

talk BootHolidayTalk(holiday)
{
	\s[forward]Hm? \s[eyeroll]Oh, it's you. \i[10]Happy {TrimHolidayName(holiday)} and whatnot.
	
	\s[phone]Unrelated, I'm setting up a party. \s[tongue]I think I'll go ahead and order {morestreamers}, that'll bring out the party spirit for sure.
}

talk BootHolidayTalk(holiday)
{
	\s[phone]Hey. I'm having a not-{TrimHolidayName(holiday)} party.
	
	\s[tongue]Should be fun~
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

talk CloseStillPartyingTalk
{
	\s[annoyed]Hello? I've got a party going on here. \s[phone]I'll leave once it's wrapped up.
}


//————— Random failure, summons more items —————
//{SurfaceRefresh} to show the items
talk CloseNotYetTalk
{
	\s[annoyed]... \w8\s[tongue]Oh, look what just showed up. {SurfaceRefresh}\s[laugh]The party's still going!
	
	\s[anger]Stop trying to ruin it, thanks.
}

talk CloseNotYetTalk
{
	\s[away]... \w8\s[tongue]Not so fast, look what just got here~ {SurfaceRefresh}\s[laugh]Perfect timing!
}

talk CloseNotYetTalk
{
	\s[anger]... \w8\s[annoyed]... \w8\s[away]... \w8\s[tongue] Not quite, check it out~ {SurfaceRefresh}\s[laugh]My delivery got here just in time to keep the party dream alive!
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

talk CloseCleanedUpTalk
{
	\s[annoyed]... \w8\w8\s[anger]You know what, fine. Fine! \s[shout]You've ruined \f[italic,1]everything!\f[italic,default]
	
	I had a nice party going, and you've \f[italic,1]completely wrecked it!!\f[italic,default]
	
	\s[anger]I'm going somewhere else. Enjoy having a boring, fun-free night.
}

talk CloseCleanedUpTalk
{
	\s[away]... All my cakes, snacks, decorations... \s[annoyed]you got rid of all of it? \s[anger]What are you, the fun police?
	
	\s[eyeroll]\i[10]Is it really so bad for me to have a few friends over to share some food and drink, and play some games? \s[away]I was even going to help you clean it up later.
	
	\s[annoyance]But no, you have to kick us out so you can "get a good night's sleep", or whatever excuse it is this time. \s[anger]Well, \f[italic,1]fine\f[italic,default] then. \s[shout]Sweet dreams, we'll party somewhere else where \f[italic,1]you\f[italic,default] aren't.
}


//————— Pet-closed last item —————
talk CloseStopTouchingThingsTalk(p)
{
	\s[anger]Stop putting your hands all over my stuff! \p[{p}]\s[-1]\0\s[shout]Ugh, I can't deal with this anymore! If you're gonna mess everything up, then I'm leaving!!
}

talk CloseStopTouchingThingsTalk(p)
{
	\s[anger]Yuck, yuck, yuck! \s[shout]Stop \f[italic,1]doing\f[italic,default] that!! \p[{p}]\s[-1]\0\s[shout]I can't stand this anymore. \s[anger]If you're gonna get all my party decorations nasty then me and my friends are going somewhere else to party!
}
talk CloseStopTouchingThingsTalk(p)
{
	\s[anger]Stop \f[italic,1]doing\f[italic,default] that! That's not yours, stop putting your nasty, oily hands all over it! \p[{p}]\s[-1]\0\s[shout]Ugh, that's it, enough is enough!
	
	If you're gonna be weird, then I'm leaving and taking the party with me. Goodbye.
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