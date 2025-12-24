// talk DecoBottomTalk@PartyBanner(p)
// {
	// \p[{p}]{narrator}temp{narratoroff}
// }

//——————————————— Balloons ———————————————
talk DecoBottomTalk@BottomBalloons(p)
{
	\p[{p}]{narrator}Elegant creatures, masters of the skies... Yet tethered to the earth. Tragic...{narratoroff}
}

//——————————————— Lights ———————————————

//——————————————— Drink bowls ———————————————
function DecoBottomTalk@DrinkBowl(p,type)
{
	if (type == "water bowl") return DecoBottomTalk@WaterBowl(p);
	else return DecoBottomTalk@OtherDrinkBowl(p);
}

talk DecoBottomTalk@WaterBowl(p)
{
	\p[{p}]{narrator}Is this... just plain water?{narratoroff}
}

talk DecoBottomTalk@WaterBowl(p)
{
	\p[{p}]{narrator}Plain water in a punch bowl...?{narratoroff}
}

talk DecoBottomTalk@OtherDrinkBowl(p)
{
	\p[{p}]{narrator}Looks like punch of some kind...{narratoroff}
}

talk DecoBottomTalk@OtherDrinkBowl(p)
{
	\p[{p}]{narrator}Some sugary drink or another...{narratoroff}
}

talk DecoBottomTalk@OtherDrinkBowl(p)
{
	\p[{p}]{narrator}Looks a bit sickly... did she get the ratio of drink mix to water correct?{narratoroff}
}

//——————————————— Food bowls ———————————————
function DecoBottomMenuOpt@FoodBowl(p,type)
{
	if (type == "candy bowl")
	{
		return "\![*]\__q[OnCandyBowl@TakePiece]Take a piece of candy\__q\n";
	}
}

talk OnCandyBowl@TakePiece
{
	\s[tongue]It's good candy, right?
}

talk OnCandyBowl@TakePiece
{
	\s[tongue]Yeah, feel free to have some. I've got plenty more on the way.
}