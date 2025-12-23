//Fallback cases for when there's no special response for a particular item type or guest personality

//Shouldn't happen... depends how we build it. Either way, avoids runtime errors. You know, I could also use try/catch for this...
//———————————————————— Guests ————————————————————
talk GuestTalk@fallback(p)
{
	\p[{p}]...
}

talk GuestLeave@fallback(p)
{
	\p[{p}]...
}


//———————————————————— Deco ————————————————————
talk DecoTalk@fallback(p)
{
	\p[{p}]{narrator}Where does she get all this stuff...?{narratoroff}
}

talk DecoTalk@fallback(p)
{
	\p[{p}]{narrator}How many party supplies can one elf set up...?{narratoroff}
}

talk DecoTalk@fallback(p)
{
	\p[{p}]{narrator}The tag is still on it...{narratoroff}
}


talk DecoPetClose@fallback(p)
{
	\s[anger]Stop putting your hands on everything! \p[{p}]\s[-1]\0\s[eyeroll]\i[10]I'll have to get a replacement, ugh.
}


talk DecoPet@fallback(p)
{
	\s[annoyed]Keep your hands to yourself!
}

talk DecoPet@fallback(p)
{
	\s[annoyed]Ew, don't put your hands all over that!
}

talk DecoPet@fallback(p)
{
	\s[annoyed]Stop touching my decorations, you're getting them all grubby!
}


//TODO this was a placeholder, havent decided if i want to replace it yet...
talk DecoClose@fallback(p)
{
	\p[{p}]\s[-1]{narrator}Shoo, out of here...{narratoroff}
}