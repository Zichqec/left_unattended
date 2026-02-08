// talk DecoBottom@TEMP@Talk
// {
	// {narrator}temp{narratoroff}
// }

//DecoBottom@TEMP@Talk
//DecoBottom@TEMP@MenuOpt
//DecoBottom@TEMP@Close
//DecoBottom@TEMP@Pet
//DecoBottom@TEMP@PetClose
//DecoBottom@TEMP@NeedlePoke
//DecoBottom@TEMP@NeedleClose
//DecoBottom@TEMP@GiveCake
//DecoBottom@TEMP@CakeClose

//——————————————— Balloons ———————————————
talk DecoBottom@BottomBalloons@Talk
{
	{narrator}Elegant creatures, masters of the skies... Yet tethered to the earth. Tragic...{narratoroff}
}

//DecoBottom@BottomBalloons@MenuOpt
//DecoBottom@BottomBalloons@Close
//DecoBottom@BottomBalloons@Pet
//DecoBottom@BottomBalloons@PetClose
//DecoBottom@BottomBalloons@NeedlePoke
//DecoBottom@BottomBalloons@NeedleClose
//DecoBottom@BottomBalloons@GiveCake
//DecoBottom@BottomBalloons@CakeClose


//——————————————— Lights ———————————————
//DecoBottom@SpotLights@Talk
//DecoBottom@SpotLights@MenuOpt
//DecoBottom@SpotLights@Close
//DecoBottom@SpotLights@Pet
//DecoBottom@SpotLights@PetClose
//DecoBottom@SpotLights@NeedlePoke
//DecoBottom@SpotLights@NeedleClose
//DecoBottom@SpotLights@GiveCake
//DecoBottom@SpotLights@CakeClose


//——————————————— Drink bowls ———————————————
talk DecoBottom@DrinkBowl@water_bowl@Talk
{
	{narrator}Is this... just plain water?{narratoroff}
}

talk DecoBottom@DrinkBowl@water_bowl@Talk
{
	{narrator}Plain water in a punch bowl...?{narratoroff}
}

talk DecoBottom@DrinkBowl@Talk
{
	{narrator}Looks like punch of some kind...{narratoroff}
}

talk DecoBottom@DrinkBowl@Talk
{
	{narrator}Some sugary drink or another...{narratoroff}
}

talk DecoBottom@DrinkBowl@Talk
{
	{narrator}Looks a bit sickly... did she get the ratio of drink mix to water correct?{narratoroff}
}

//DecoBottom@DrinkBowl@MenuOpt
//DecoBottom@DrinkBowl@Close
//DecoBottom@DrinkBowl@Pet
//DecoBottom@DrinkBowl@PetClose
//DecoBottom@DrinkBowl@NeedlePoke
//DecoBottom@DrinkBowl@NeedleClose
//DecoBottom@DrinkBowl@GiveCake
//DecoBottom@DrinkBowl@CakeClose


//——————————————— Food bowls ———————————————
talk DecoBottom@FoodBowl@candy_bowl@MenuOpt
{
	\![*]\__q[OnCandyBowl@TakePiece]Take a piece of candy\__q\n
}

talk OnCandyBowl@TakePiece
{
	\s[tongue]It's good candy, right?
}

talk OnCandyBowl@TakePiece
{
	\s[tongue]Yeah, feel free to have some. I've got plenty more on the way.
}

talk DecoBottom@FoodBowl@noodle_bowl@Talk
{
	{narrator}There's no cup... are you supposed to eat this with your hands? Pour it straight into your throat...?{narratoroff}
}

talk DecoBottom@FoodBowl@candy_bowl@Talk
{
	{narrator}This candy looks innocent enough...{narratoroff}
}

talk DecoBottom@FoodBowl@Talk
{
	{narrator}The sound of the sink hasn't been heard even once tonight... ew.{narratoroff}
}

talk DecoBottom@FoodBowl@mashed_potato_bowl@Pet
{
	\s[annoyed]... Gross. \s[anger]That's \f[italic,1]mashed potatoes\f[italic,default], not clay.
}

talk DecoBottom@FoodBowl@noodle_bowl@Pet
{
	\s[annoyed]... Seriously? \s[anger]Don't stick your hands in the noodle soup, use the \s[eyeroll]\i[10]\f[italic,1]ladle\f[italic,default] like a civilized person.
}

talk DecoBottom@FoodBowl@Pet
{
	\s[annoyed]Don't just stick your hands all over the food, gross.
}

//DecoBottom@FoodBowl@Close
//DecoBottom@FoodBowl@PetClose
//DecoBottom@FoodBowl@NeedlePoke
//DecoBottom@FoodBowl@NeedleClose
//DecoBottom@FoodBowl@GiveCake
//DecoBottom@FoodBowl@CakeClose