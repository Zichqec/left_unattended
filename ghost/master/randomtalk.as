talk RandomTalk
{
	\s[phone]Ugh, they're taking \f[italic,1]forever\f[italic,default] to get {thecheesecake} here. \s[annoyed]What's the holdup?
}

talk RandomTalk
{
	\s[eyeroll]\i[10]Oh come on, I have \f[italic,1]not\f[italic,default] maxed out this credit card already. \s[phone]Sheesh...
}

talk RandomTalk
{
	\s[phone]... \w8\s[tongue]Score, that little {discoball} is mine, hehe~
}

talk RandomTalk
{
	\s[away]Hmm... \w8\w8\s[tongue]Well, why not. There's no such thing as too {muchcake}.
}

talk RandomTalk
{
	\s[eyeroll]\i[10]Oh, for crying out loud. \s[annoyed]I misspelled the message on the custom banner I just ordered.
	
	\s[phone]Cancel that...
}

talk RandomTalk
{
	\s[away]{Capitalize(vanilla)} or {blueberry}... \w8\s[tongue]Both.
}

talk RandomTalk
{
	\s[tongue]Hehehehe, of \f[italic,1]course\f[italic,default] I want to write a custom message on it...
}

talk RandomTalk
{
	\s[away]Hmm... \w8\w8\s[forward]I want to get one of these giant snack bars, but your doorway is too small to bring it inside.
	
	\s[annoyed]You should fix that.
}

talk RandomTalk
{
	\s[phone]Ooh, flash sale... \s[tongue]Guess we're having {morestreamers}.
}

talk RandomTalk
{
	\s[phone]Another round of invites sent... \s[tongue]Let's see who bites.
}

talk RandomTalk
{
	\s[phone]I already looked through all these, didn't I...?
	
	\s[away]... \w8\w8Or was that during last week's party...
}

talk RandomTalk
{
	\s[phone]Don't they have an option for "one of everything"...? \s[eyeroll]Do I seriously have to tick each option by hand?
	
	\i[10]Ugh, whatever.
}

talk RandomTalk
{
	\s[phone]Unbelievable. \s[annoyed]Outrageous shipping costs on these {plushsushi}.
	
	\s[eyeroll]Then again, they \f[italic,1]are\f[italic,default] really cute...
	
	\s[tongue]Maybe just this once~
}

talk RandomTalk
{
	\s[phone]This vendor doesn't have a space for me to write special delivery instructions. \s[annoyed]Last time I tried ordering something without special delivery instructions, the delivery person got lost and I never received the item.
	
	\s[eyeroll]You have \i[10]\f[italic,1]got\f[italic,default] to move house at some point. This place is too confusing, it's such a pain.
}

talk RandomTalk
{
	\s[phone]Hmm... \w8\s[forward]Do you have a charging cable with you? \s[eyeroll]My phone's starting to get low on battery. \i[10]Again.
}

talk RandomTalk
{
	\s[away]Do I have {enoughballoons} on the way...? \s[phone]I should get more, just in case...
}

talk RandomTalk
{
	\s[eyeroll]Will it fit in here...? \w8\s[away]Hmm... \w8
	
	\s[tongue]I'll make it fit~
}

talk RandomTalk
{
	\s[tongue]Oh yeah, that's the ticket. \s[laugh]Everyone will love it for sure.
}

talk RandomTalk
{
	\s[annoyed]I can't believe that every place I look for {plushsushi} is sold out. \s[eyeroll]\i[10]What's with the huge rush on them, it's not like they're an endangered species.
}

talk RandomTalk
{
	\s[annoyed]I really ought to charge admission, that would cover the cost of the party supplies at least.
	
	\s[eyeroll]But then there would be fewer guests, which would defeat the point of having a party in the first place...
	
	\i[10]Oh well, I guess we'll just have to keep footing the bill for the greater good.
}

talk RandomTalk
{
	\s[eyeroll]\i[10]Ugh, I bought a bunch of {bagsofglitter} from this little shop for last week's party, and for some reason they're out of stock now!
	
	\s[away]Maybe my party popularized the place, and now everyone wants to buy from them...
	
	\s[tongue]That's gotta be it. Heh, another good deed~
}

talk RandomTalk
{
	\s[phone]Wow. This party supplier doesn't have {balloons} for sale. \s[eyeroll]\i[10]Why even run a party store, then.
}

talk RandomTalk
{
	\s[phone]Hmm... \s[away]their color variety is really poor. \s[eyeroll]But maybe if I got some spray paint, I could DIY a solution...
}

talk RandomTalk
{
	\s[away]You should really repaint the livingroom. \s[eyeroll]A more vibrant color would liven the place up a lot.
	
	\s[tongue]I'll help you pick out the color~
}

talk RandomTalk
{
	\s[away]Hm... to order more {jello} or not...
	
	\s[tongue]I guess leftovers wouldn't hurt, we can pawn them off on the neighbors again.
}

talk RandomTalk
{
	\s[phone]Tch, why is my credit score so low? \s[annoyed]I bet you have something to do with this, don't you? 
	
	\s[away]... \s[eyeroll]Okay, fine, maybe it's because this is the third new card I've tried to open this month. \i[10]But I wouldn't put it past you to interfere somehow.
}

talk RandomTalk
{
	\s[tongue]Score, got into a new group chat. Invite~
}

talk RandomTalk
{
	%{
		local text1 = partytext();
		local text2 = partytext();
		while (text1 == text2) {text2 = partytext();}
	}
	\s[tongue]Come party... at my place... {text1} {text2} 
	
	\s[laugh]And sent! That ought to bring in a few new faces.
}

talk RandomTalk
{
	\s[away]I wonder if there's another party nearby that's impacting mine...
	
	\s[phone]I'll have to scour the local party groups and see who it could be. \s[tongue]Maybe I'll have a job for you.
}

talk RandomTalk
{
	\s[annoyed]I hit the data limit again. Can we \s[eyeroll]\i[10]\f[italic,1]please\f[italic,default] switch to a limitless plan already? \s[away]This is so miserable.
}


//———————————————————— Conditional dialogues ————————————————————
//Done carefully to avoid upsetting nonoverlap... although this is kind of a bad method if I add more than one. Hm! There's probably a better way I'm forgetting, I am just tired... work on this later perhaps.
talk RandomTalk
{
	>ManyGuestTalk : ManyGuests()
	>FewGuestTalk : FewGuests()
	>NoGuestTalk
}

talk ManyGuestTalk
{
	\s[tongue]Another successful party. \s[laugh]Jes never disappoints.
}

talk FewGuestTalk
{
	\s[away]I sent out more invites than this... \s[eyeroll]A \f[italic,1]lot\f[italic,default] more...
	
	\s[tongue]Guess I'll send some more~
}

talk NoGuestTalk
{
	\s[away]Hmm... where is everyone?
}