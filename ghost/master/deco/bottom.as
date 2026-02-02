// talk DecoBottom@PartyBanner@Talk
// {
	// {narrator}temp{narratoroff}
// }

//——————————————— Balloons ———————————————
talk DecoBottom@BottomBalloons@Talk
{
	{narrator}Elegant creatures, masters of the skies... Yet tethered to the earth. Tragic...{narratoroff}
}

//——————————————— Lights ———————————————

//——————————————— Drink bowls ———————————————
function DecoBottom@DrinkBowl@Talk(type)
{
	if (type == "water bowl") return DecoBottom@WaterBowl@Talk();
	else return DecoBottom@OtherDrinkBowl@Talk();
}

talk DecoBottom@WaterBowl@Talk
{
	{narrator}Is this... just plain water?{narratoroff}
}

talk DecoBottom@WaterBowl@Talk
{
	{narrator}Plain water in a punch bowl...?{narratoroff}
}

talk DecoBottom@OtherDrinkBowl@Talk
{
	{narrator}Looks like punch of some kind...{narratoroff}
}

talk DecoBottom@OtherDrinkBowl@Talk
{
	{narrator}Some sugary drink or another...{narratoroff}
}

talk DecoBottom@OtherDrinkBowl@Talk
{
	{narrator}Looks a bit sickly... did she get the ratio of drink mix to water correct?{narratoroff}
}

//——————————————— Food bowls ———————————————
function DecoBottom@FoodBowl@MenuOpt(type)
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

function DecoBottom@FoodBowl@Talk(type)
{
	if (type == "noodle bowl") return DecoBottom@NoodleBowl@Talk();
	else if (type == "candy bowl") return DecoBottom@CandyBowl@Talk();
	else return DecoBottom@OtherFoodBowl@Talk();
}

talk DecoBottom@NoodleBowl@Talk(type)
{
	{narrator}There's no cup... are you supposed to eat this with your hands? Pour it straight into your throat...?{narratoroff}
}

talk DecoBottom@CandyBowl@Talk
{
	{narrator}This candy looks innocent enough...{narratoroff}
}

talk DecoBottom@OtherFoodBowl@Talk(type)
{
	{narrator}The sound of the sink hasn't been heard even once tonight... ew.{narratoroff}
}

function DecoBottom@FoodBowl@Pet(type)
{
	if (type == "mashed potato bowl") return DecoBottom@MashedPotatoBowl@Pet();
	else if (type == "noodle bowl") return DecoBottom@NoodleBowl@Pet();
	else return DecoBottom@OtherFoodBowl@Pet();
}

talk DecoBottom@MashedPotatoBowl@Pet
{
	\s[annoyed]... Gross. \s[anger]That's \f[italic,1]mashed potatoes\f[italic,default], not clay.
}

talk DecoBottom@NoodleBowl@Pet
{
	\s[annoyed]... Seriously? \s[anger]Don't stick your hands in the noodle soup, use the \s[eyeroll]\i[10]\f[italic,1]ladle\f[italic,default] like a civilized person.
}

talk DecoBottom@OtherFoodBowl@Pet
{
	\s[annoyed]Don't just stick your hands all over the food, gross.
}