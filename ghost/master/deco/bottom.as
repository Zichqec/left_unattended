// talk DecoBottom@Talk@PartyBanner(p)
// {
	// \p[{p}]{narrator}temp{narratoroff}
// }

//——————————————— Balloons ———————————————
talk DecoBottom@Talk@BottomBalloons(p)
{
	\p[{p}]{narrator}Elegant creatures, masters of the skies... Yet tethered to the earth. Tragic...{narratoroff}
}

//——————————————— Lights ———————————————

//——————————————— Drink bowls ———————————————
function DecoBottom@Talk@DrinkBowl(p,type)
{
	if (type == "water bowl") return DecoBottom@Talk@WaterBowl(p);
	else return DecoBottom@Talk@OtherDrinkBowl(p);
}

talk DecoBottom@Talk@WaterBowl(p)
{
	\p[{p}]{narrator}Is this... just plain water?{narratoroff}
}

talk DecoBottom@Talk@WaterBowl(p)
{
	\p[{p}]{narrator}Plain water in a punch bowl...?{narratoroff}
}

talk DecoBottom@Talk@OtherDrinkBowl(p)
{
	\p[{p}]{narrator}Looks like punch of some kind...{narratoroff}
}

talk DecoBottom@Talk@OtherDrinkBowl(p)
{
	\p[{p}]{narrator}Some sugary drink or another...{narratoroff}
}

talk DecoBottom@Talk@OtherDrinkBowl(p)
{
	\p[{p}]{narrator}Looks a bit sickly... did she get the ratio of drink mix to water correct?{narratoroff}
}

//——————————————— Food bowls ———————————————
function DecoBottom@MenuOpt@FoodBowl(p,type)
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

function DecoBottom@Talk@FoodBowl(p,type)
{
	if (type == "noodle bowl") return DecoBottom@Talk@NoodleBowl(p);
	else if (type == "candy bowl") return DecoBottom@Talk@CandyBowl(p);
	else return DecoBottom@Talk@OtherFoodBowl(p);
}

talk DecoBottom@Talk@NoodleBowl(p,type)
{
	\p[{p}]{narrator}There's no cup... are you supposed to eat this with your hands? Pour it straight into your throat...?{narratoroff}
}

talk DecoBottom@Talk@CandyBowl(p)
{
	\p[{p}]{narrator}This candy looks innocent enough...{narratoroff}
}

talk DecoBottom@Talk@OtherFoodBowl(p,type)
{
	\p[{p}]{narrator}I haven't heard the sink running tonight... ew.{narratoroff}
}

function DecoBottom@Pet@FoodBowl(p,type)
{
	if (type == "mashed potato bowl") return DecoBottom@Pet@MashedPotatoBowl(p);
	else if (type == "noodle bowl") return DecoBottom@Pet@NoodleBowl(p);
	else return DecoBottom@Pet@OtherFoodBowl(p);
}

talk DecoBottom@Pet@MashedPotatoBowl(p)
{
	\s[annoyed]... Gross. \s[anger]That's \f[italic,1]mashed potatoes\f[italic,default], not clay.
}

talk DecoBottom@Pet@NoodleBowl(p)
{
	\s[annoyed]... Seriously? \s[anger]Don't stick your hands in the noodle soup, use the \s[eyeroll]\i[10]\f[italic,1]ladle\f[italic,default] like a civilized person.
}

talk DecoBottom@Pet@OtherFoodBowl(p)
{
	\s[annoyed]Don't just stick your hands all over the food, gross.
}