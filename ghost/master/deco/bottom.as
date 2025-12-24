// talk DecoBottomTalk@happypartybanner(p)
// {
	// \p[{p}]it's a bit frayed...
// }

function DecoBottomMenuOpt@FoodBowl(type)
{
	if (type == "candy bowl")
	{
		return "\![*]\__q[OnCandyBowl@TakePiece]Take a piece of candy\__q\n";
	}
}

talk OnCandyBowl@TakePiece
{
	\s[tongue]\i[10]It's good candy, right?
}