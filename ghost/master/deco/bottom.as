// talk DecoBottom@PartyBanner@Talk(p)
// {
	// \p[{p}]{narrator}temp{narratoroff}
// }

//——————————————— Balloons ———————————————
talk DecoBottom@BottomBalloons@Talk(p)
{
	\p[{p}]{narrator}Elegant creatures, masters of the skies... Yet tethered to the earth. Tragic...{narratoroff}
}

//——————————————— Lights ———————————————

//——————————————— Drink bowls ———————————————
function DecoBottom@DrinkBowl@Talk(p,type)
{
	if (type == "water bowl") return DecoBottom@WaterBowl@Talk(p);
	else return DecoBottom@OtherDrinkBowl@Talk(p);
}

talk DecoBottom@WaterBowl@Talk(p)
{
	\p[{p}]{narrator}Is this... just plain water?{narratoroff}
}

talk DecoBottom@WaterBowl@Talk(p)
{
	\p[{p}]{narrator}Plain water in a punch bowl...?{narratoroff}
}

talk DecoBottom@OtherDrinkBowl@Talk(p)
{
	\p[{p}]{narrator}Looks like punch of some kind...{narratoroff}
}

talk DecoBottom@OtherDrinkBowl@Talk(p)
{
	\p[{p}]{narrator}Some sugary drink or another...{narratoroff}
}

talk DecoBottom@OtherDrinkBowl@Talk(p)
{
	\p[{p}]{narrator}Looks a bit sickly... did she get the ratio of drink mix to water correct?{narratoroff}
}

//——————————————— Food bowls ———————————————
function DecoBottom@FoodBowl@MenuOpt(p,type)
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

function DecoBottom@FoodBowl@Talk(p,type)
{
	if (type == "noodle bowl") return DecoBottom@NoodleBowl@Talk(p);
	else if (type == "candy bowl") return DecoBottom@CandyBowl@Talk(p);
	else return DecoBottom@OtherFoodBowl@Talk(p);
}

talk DecoBottom@NoodleBowl@Talk(p,type)
{
	\p[{p}]{narrator}There's no cup... are you supposed to eat this with your hands? Pour it straight into your throat...?{narratoroff}
}

talk DecoBottom@CandyBowl@Talk(p)
{
	\p[{p}]{narrator}This candy looks innocent enough...{narratoroff}
}

talk DecoBottom@OtherFoodBowl@Talk(p,type)
{
	\p[{p}]{narrator}The sound of the sink hasn't been heard even once tonight... ew.{narratoroff}
}

function DecoBottom@FoodBowl@Pet(p,type)
{
	if (type == "mashed potato bowl") return DecoBottom@MashedPotatoBowl@Pet(p);
	else if (type == "noodle bowl") return DecoBottom@NoodleBowl@Pet(p);
	else return DecoBottom@OtherFoodBowl@Pet(p);
}

talk DecoBottom@MashedPotatoBowl@Pet(p)
{
	\s[annoyed]... Gross. \s[anger]That's \f[italic,1]mashed potatoes\f[italic,default], not clay.
}

talk DecoBottom@NoodleBowl@Pet(p)
{
	\s[annoyed]... Seriously? \s[anger]Don't stick your hands in the noodle soup, use the \s[eyeroll]\i[10]\f[italic,1]ladle\f[italic,default] like a civilized person.
}

talk DecoBottom@OtherFoodBowl@Pet(p)
{
	\s[annoyed]Don't just stick your hands all over the food, gross.
}