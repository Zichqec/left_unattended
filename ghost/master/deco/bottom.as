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
talk DecoBottom@SpotLights@Talk
{
	{narrator}Consuming a lot of electricity...{narratoroff}
}

talk DecoBottom@SpotLights@Talk
{
	{narrator}Stand here to be the center of attention...{narratoroff}
}

talk DecoBottom@SpotLights@Talk
{
	{narrator}These are generating a lot of heat...{narratoroff}
}


talk DecoBottom@SpotLights@GiveCake
{
	\s[annoyed]Cut that out, \s[eyeroll]\i[10]it's probably a fire hazard or something.
}

talk DecoBottom@SpotLights@GiveCake
{
	\s[annoyed]Don't smear cake across those, you're blocking the light!
}


talk DecoBottom@SpotLights@CakeClose(p)
{
	\s[annoyed]Great, now these are useless until someone cleans them. \p[{p}]\s[-1]\0
	
	\s[anger]I hope you know that someone is going to be \f[italic,1]you.\f[italic,default]
}


//DecoBottom@SpotLights@MenuOpt
//DecoBottom@SpotLights@Close
//DecoBottom@SpotLights@Pet
//DecoBottom@SpotLights@PetClose
//DecoBottom@SpotLights@NeedlePoke
//DecoBottom@SpotLights@NeedleClose


//——————————————— Drink bowls ———————————————
talk DecoBottom@DrinkBowl@water_bowl@Talk
{
	{narrator}Is this... just plain water?{narratoroff}
}

talk DecoBottom@DrinkBowl@water_bowl@Talk
{
	{narrator}Plain water in a punch bowl...?{narratoroff}
}

talk DecoBottom@DrinkBowl@water_bowl@Talk
{
	{narrator}Ordinary water... A better hydration choice for sure, but why the punch bowl...{narratoroff}
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


talk DecoBottom@DrinkBowl@water_bowl@Pet
{
	\s[annoyed]That is \f[italic,1]not\f[italic,default] a handwashing station! \s[eyeroll]\i[10]Go use the sink if you're worried about that!
}

talk DecoBottom@DrinkBowl@water_bowl@Pet
{
	\s[annoyed]Get your hands out of the water, if you want to wash your hands use the sink!
}


talk DecoBottom@DrinkBowl@Pet
{
	\s[annoyed]Don't dip your hands in there, use the ladle and fill a cup!
}

talk DecoBottom@DrinkBowl@Pet
{
	\s[annoyed]Gross, people are drinking out of that! Keep your nasty hands out of it, use the ladle!
}


talk DecoBottom@DrinkBowl@PetClose, DecoBottom@DrinkBowl@NeedleClose(p)
{
	\s[anger]Yuck, it's full of germs now. \s[eyeroll]Is it so hard to follow basic hygeine practices? \i[10]I provided a ladle and everything. \p[{p}]\s[-1]\0
	
	\s[away]Fine, I'll just put out some more. ... \s[phone]Once I get a new bowl.
}


talk DecoBottom@DrinkBowl@NeedlePoke
{
	\s[annoyed]Don't put foreign objects in there, yuck! People are drinking that!
}

talk DecoBottom@DrinkBowl@NeedlePoke
{
	\s[annoyed]That's not a ladle, stop making a mess!
}


talk DecoBottom@DrinkBowl@GiveCake
{
	\s[annoyed]Don't dip your cake in there, gross!
}

talk DecoBottom@DrinkBowl@GiveCake
{
	\s[annoyed]Yuck! You're going to get cake crumbs and frosting in there!
}


talk DecoBottom@DrinkBowl@CakeClose(p)
{
	\s[annoyed]Ew, enough, enough! \s[eyeroll]Nobody else is going to want this now, \i[10]I'll have to pour it out. \p[{p}]\s[-1]\0
	
	\s[anger]What's with you, anyway. You can't seriously want to eat soggy cake. Yuck!
}


//DecoBottom@DrinkBowl@MenuOpt
//DecoBottom@DrinkBowl@Close


//——————————————— Food bowls ———————————————
talk DecoBottom@FoodBowl@candy_bowl@MenuOpt
{
	\![*]\__q[OnCandyBowl@TakePiece]Take a piece of candy\__q\n\n
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

talk DecoBottom@FoodBowl@noodle_bowl@Talk
{
	{narrator}Chicken noodle...{narratoroff}
}


talk DecoBottom@FoodBowl@candy_bowl@Talk
{
	{narrator}This candy looks innocent enough...{narratoroff}
}


talk DecoBottom@FoodBowl@Talk
{
	{narrator}The sound of the sink hasn't been heard even once tonight... ew.{narratoroff}
}

talk DecoBottom@FoodBowl@Talk
{
	{narrator}There's no utensil to get this out with... or plates to put it on.{narratoroff}
}

talk DecoBottom@FoodBowl@Talk
{
	{narrator}Evidently you're supposed to simply take a handful and carry it with you...{narratoroff}
}


talk DecoBottom@FoodBowl@mashed_potato_bowl@Pet
{
	\s[annoyed]... Gross. \s[anger]That's \f[italic,1]mashed potatoes\f[italic,default], not clay.
}

talk DecoBottom@FoodBowl@mashed_potato_bowl@Pet
{
	\s[annoyed]That's not a sandbox, stop playing with the mashed potatoes!
}


talk DecoBottom@FoodBowl@noodle_bowl@Pet
{
	\s[annoyed]... Seriously? \s[anger]Don't stick your hands in the noodle soup, use the \s[eyeroll]\i[10]\f[italic,1]ladle\f[italic,default] like a civilized person.
}

talk DecoBottom@FoodBowl@noodle_bowl@Pet
{
	\s[annoyed]Stop swirling the soup around with your hands, use the ladle!
}


talk DecoBottom@FoodBowl@Pet
{
	\s[annoyed]Don't just stick your hands all over the food, gross.
}

talk DecoBottom@FoodBowl@Pet
{
	\s[annoyed]Take a handful and then move on, don't stand there and dig through the whole bowl!
}


talk DecoBottom@FoodBowl@PetClose(p)
{
	\s[annoyed]Great. You've got your finger oils all through the food. \s[anger]Are you happy now? \p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]Whatever, I'll just toss that and get some more.
}


talk DecoBottom@FoodBowl@NeedlePoke
{
	\s[annoyed]Stop that, you're going to create a choking hazard!
}

talk DecoBottom@FoodBowl@NeedlePoke
{
	\s[annoyed]Don't hide pointy things in the food, someone's going to get hurt!
}

talk DecoBottom@FoodBowl@NeedleClose(p)
{
	\s[annoyed]No, enough of that. \p[{p}]\s[-1]\0That's dangerous.
	
	\s[anger]Stop trying to \f[italic,1]kill\f[italic,default] my guests, thanks.
}


talk DecoBottom@FoodBowl@candy_bowl@GiveCake
{
	\s[annoyed]No, no, no. That's \f[italic,1]candy\f[italic,default], cake isn't candy. \s[eyeroll]\i[10]Don't try to mix the two.
}

talk DecoBottom@FoodBowl@candy_bowl@GiveCake
{
	\s[annoyed]Don't smash your cake into the candy bowl. \s[eyeroll]\i[10]At least the candy is protected by having individual wrappers, but nobody is going to want to pick candy out of there if they're going to get cake all over their hands while doing so!
	
	\s[anger]Except you, I guess.
}


talk DecoBottom@FoodBowl@GiveCake
{
	\s[annoyed]Yuck, don't stick your cake in there! Nobody is going to want to eat that if it's got smashed up cake all over it.
}

talk DecoBottom@FoodBowl@GiveCake
{
	\s[annoyed]Ew, ew, ew! Don't smash cake all over the food, eat them separately!
}


talk DecoBottom@FoodBowl@candy_bowl@CakeClose(p)
{
	\s[annoyed]Ugh, enough, stop that! \p[{p}]\s[-1]\0\s[eyeroll]\i[10]I'll have to get out some more candy.
	
	\s[annoyed]I guess you can have this bowlful that you so kindly ruined... \s[anger]\f[italic,1]after\f[italic,default] you pay me for it.
}


talk DecoBottom@FoodBowl@CakeClose(p)
{
	\s[annoyed]Enough, cut it out! That's so gross. \p[{p}]\s[-1]\0
	
	\s[eyeroll]\i[10]Not everyone wants cake mixed in with every meal, believe it or not. \s[anger]If you want to mix foods, mix them on your own plate.
}


//DecoBottom@FoodBowl@Close