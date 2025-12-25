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


//———————————————————— Deco flavortext ————————————————————
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

talk DecoTalk@fallback(p)
{
	\p[{p}]{narrator}Looks kind of cheap...{narratoroff}
}

talk DecoTalk@fallback(p)
{
	\p[{p}]{narrator}... Is this a fake?{narratoroff}
}

talk DecoTalk@fallback(p)
{
	\p[{p}]{narrator}Somehow, this takes up much more space than it should...{narratoroff}
}


//———————————————————— Deco close by menu ————————————————————
talk DecoClose@fallback(p)
{
	\p[{p}]\s[-1]{narrator}Pack that up...{narratoroff}
}

talk DecoClose@fallback(p)
{
	\p[{p}]\s[-1]{narrator}Let's just put that out of sight while she isn't looking...{narratoroff}
}

talk DecoClose@fallback(p)
{
	\p[{p}]\s[-1]{narrator}One less thing to put away later...{narratoroff}
}

talk DecoClose@fallback(p)
{
	\p[{p}]\s[-1]\0\s[away]... \w8\w8\s[annoyed]\f[italic,1]Fine\f[italic,default]. \s[eyeroll]\i[10]I'll need that space for something bigger later anyway.
}


//———————————————————— Deco pet close ————————————————————
talk DecoPetClose@fallback(p)
{
	\s[anger]Stop putting your hands on everything! \p[{p}]\s[-1]\0\s[eyeroll]\i[10]I'll have to get a replacement, ugh.
}

talk DecoPetClose@fallback(p)
{
	\s[anger]Don't get my decorations all gross with your fingerprints! \p[{p}]\s[-1]\0\s[eyeroll]\i[10]Ugh, whatever, I'll just put something else here.
}

talk DecoPetClose@fallback(p)
{
	\s[annoyed]You're ruining my decorations! \s[anger]Look how nasty it is with your grubby hand marks on it! \p[{p}]\s[-1]\0\s[eyeroll]\i[10]\f[italic,1]Fine\f[italic,default], I'll just have to get something better in to replace it.
}


//———————————————————— Deco petting ————————————————————
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

talk DecoPet@fallback(p)
{
	\s[annoyed]Get your oily fingers off my party decor!
}

talk DecoPet@fallback(p)
{
	\s[annoyed]Cut that out, I have it set up all nice and you're going to ruin it!
}

talk DecoPet@fallback(p)
{
	\s[annoyed]Don't touch that, you're going to make it look gross!
}

talk DecoPet@fallback(p)
{
	\s[annoyed]Get your fingers off that, yuck!
}