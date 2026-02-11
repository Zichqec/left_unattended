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
//{InitItemPos} to show the items
talk CloseNotYetTalk
{
	\s[annoyed]... \w8\s[tongue]Oh, look what just showed up. {InitItemPos}\s[laugh]The party's still going!
	
	\s[anger]Stop trying to ruin it, thanks.
}

talk CloseNotYetTalk
{
	\s[away]... \w8\s[tongue]Not so fast, look what just got here~ {InitItemPos}\s[laugh]Perfect timing!
}

talk CloseNotYetTalk
{
	\s[anger]... \w8\s[annoyed]... \w8\s[away]... \w8\s[tongue] Not quite, check it out~ {InitItemPos}\s[laugh]My delivery got here just in time to keep the party dream alive!
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
talk SpecialClose@PetClose(p)
{
	\s[anger]Stop putting your hands all over my stuff! \p[{p}]\s[-1]\0\s[shout]Ugh, I can't deal with this anymore! If you're gonna mess everything up, then I'm leaving!!
}

talk SpecialClose@PetClose(p)
{
	\s[anger]Yuck, yuck, yuck! \s[shout]Stop \f[italic,1]doing\f[italic,default] that!! \p[{p}]\s[-1]\0\s[shout]I can't stand this anymore. \s[anger]If you're gonna get all my party decorations nasty then me and my friends are going somewhere else to party!
}
talk SpecialClose@PetClose(p)
{
	\s[anger]Stop \f[italic,1]doing\f[italic,default] that! That's not yours, stop putting your nasty, oily hands all over it! \p[{p}]\s[-1]\0\s[shout]Ugh, that's it, enough is enough!
	
	If you're gonna be weird, then I'm leaving and taking the party with me. Goodbye.
}


//————— Needle-closed last item —————
talk SpecialClose@NeedleClose(p)
{
	\s[anger]Stop scratching everything up! \p[{p}]\s[-1]\0\s[shout]Ugh, I've had it! What kind of roommate are you anyway, destroying my stuff!?
	
	\s[annoyed]I'm leaving, you have until I get back to hide anything you want to preserve.
}


//————— Cake-closed last item (via Birthday Needle) —————
talk SpecialClose@CakeClose(p)
{
	\s[anger]Stop smashing cake into everything! \p[{p}]\s[-1]\0\s[shout]Stars above, what is with you and cake!?
	
	\s[eyeroll]\i[10]Whatever, I'm so out of here. \s[annoyed]Next time I won't get any cake, then you'll \f[italic,1]really\f[italic,default] be sad.
}


//————— Continuation of item-specific special closes —————
//This bridges them from an individual item close to a full ghost close
//These start with \x on the object side. Item is also already closed.
talk SpecialClose@Continuation
{
	\s[away]... \s[annoyed]You know what, enough is enough. \s[anger]If you're just going to ruin everything, then I'm leaving. \s[shout]I've had it with you wrecking my party!
	
	\s[anger]Enjoy your boring, party-free night. I'm going to go eat cake without you.
}

talk SpecialClose@Continuation
{
	\s[annoyed]... You know what, I'm so done with this. \s[eyeroll]\i[10]You win, the party is \f[italic,1]over\f[italic,default].
	
	\s[anger]Hope that makes you happy. \s[shout]Have fun cleaning up by yourself!!
}

talk SpecialClose@Continuation
{
	\s[annoyed]... I don't have to take this. \s[away]You've put away or ruined all the party supplies I bought, \s[eyeroll]you're being a general nuisance... \s[shout]and I'm \f[italic,1]done\f[italic,default] putting up with it!
	
	\s[annoyed]I'm going to go set up my party somewhere else, and me and my friends will enjoy cake without you. \s[anger]Think of us while you spend the night here all alone, cleaning up the mess you've made.
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