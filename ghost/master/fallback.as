//Fallback cases for when there's no special response for a particular item type or guest personality

//Shouldn't happen... depends how we build it. Either way, avoids runtime errors. You know, I could also use try/catch for this...
//———————————————————— Guests ————————————————————
talk GuestTalk@fallback(p)
{
	\p[{p}]...
}

talk GuestLeave@fallback(p)
{
	\p[{p}]bye
}


//———————————————————— Deco ————————————————————
talk DecoTalk@fallback(p)
{
	\p[{p}]default flavor
}

talk DecoPetClose@fallback(p)
{
	\p[{p}]\s[-1]\0Stop being like that, omg!!! I'll have to get another one.
}

talk DecoPet@fallback(p)
{
	Stop messing up my stuff!!!
}

talk DecoClose@fallback(p)
{
	\p[{p}]\s[-1]Shoo, out of here...
}