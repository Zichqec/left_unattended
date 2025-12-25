function bagsofglitter
{
	return Random.Select([
		"bags of {redandblue} glitter",
		"custom-printed cardboard cutouts",
		"fog machines",
	]);
}

function redandblue
{
	return Random.Select([
		"red and blue",
		"green and yellow",
		"purple and white",
		"rainbow",
		"giant",
		"extra fine",
	]);
}

function pictureframesare
{
	return Random.Select([
		"picture frames are",
		"rest of the balloons are",
		"next cake is",
		"big disco ball is",
	]);
}

function soda
{
	return Random.Select([
		"soda",
		"sparkling cider",
		"snacks",
		"paper plates",
	]);
}

function morestreamers
{
	return Random.Select([
		"more streamers",
		"another banner",
		"another sandwich platter",
		"a chocolate fountain",
	]);
}

function thecheesecake
{
	return Random.Select([
		"the cheesecake",
		"the jukebox",
		"the ambassador",
		"the extra subwoofer",
	]);
}

function discoball
{
	return Random.Select([
		"disco ball",
		"box of ribbons",
		"tray of cupcakes",
		"candy bowl",
		"shrimp decoration",
	]);
}

function muchcake
{
	return Random.Select([
		"much cake",
		"many cupcakes",
		"many fruit trays",
		"much punch",
		"many drink choices",
		"many snacks",
		"many party favors",
		"much glitter",
		"many streamers",
	]);
}

function plushsushi
{
	return Random.Select([
		"plush sushi",
		"miniature party hats",
		"glowstick necklaces",
		"sticker packs",
	]);
}

function enoughballoons
{
	return Random.Select([
		"enough balloons",
		"enough snacks",
		"enough drinks",
		"enough cake",
		"enough cups",
		"enough plates",
	]);
}

function TodaysHoliday
{
	local date = "{Time.GetNowMonth()}/{Time.GetNowDate()}";
	local holiday = null;
	
	if (date == "{Birthday.month}/{Birthday.day}") holiday = "your birthday";
	
	//Real holidays
	else if (date ==  "1/1" ) holiday = "New Year's";
	else if (date ==  "2/14") holiday = "Valentine's Day";
	else if (date ==  "2/29") holiday = "Leap Day";
	else if (date ==  "4/1" ) holiday = "April Fools' Day";
	else if (date ==  "6/23") holiday = "Pink Flamingo Day";
	else if (date ==  "8/24") holiday = "Salad Dressing Day";
	else if (date ==  "8/31") holiday = "Vegetable Day";
	else if (date == "10/31") holiday = "Halloween";
	else if (date == "12/24") holiday = "Christmas Eve";
	else if (date == "12/25") holiday = "Christmas";
	else if (date == "12/31") holiday = "New Year's Eve";
	
	//Fake holidays
	else if (date ==  "1/12") holiday = "Snowman's Day";
	else if (date ==  "1/16") holiday = "Candlefest";
	else if (date ==  "1/24") holiday = "The Suntide";
	else if (date ==  "2/4" ) holiday = "Sirdas";
	else if (date ==  "2/21") holiday = "Mūnfier";
	else if (date ==  "2/25") holiday = "Nivenia's Day";
	else if (date ==  "3/5" ) holiday = "Light's Eve";
	else if (date ==  "3/6" ) holiday = "The Lighting";
	else if (date ==  "3/17") holiday = "First Budding";
	else if (date ==  "3/25") holiday = "The Sounding";
	else if (date ==  "3/30") holiday = "Blue Sky Day";
	else if (date ==  "4/8" ) holiday = "Luliana's Day";
	else if (date ==  "4/13") holiday = "Belthandz";
	else if (date ==  "4/18") holiday = "Reyneia's Day";
	else if (date ==  "4/26") holiday = "Inking Day";
	else if (date ==  "5/3" ) holiday = "Lily Fest";
	else if (date ==  "5/9" ) holiday = "The Meridium";
	else if (date ==  "5/20") holiday = "Greater Fest";
	else if (date ==  "5/27") holiday = "Nonfier";
	else if (date ==  "6/5" ) holiday = "Skyrf Eve";
	else if (date ==  "6/6" ) holiday = "Skyrf Day";
	else if (date ==  "6/15") holiday = "Cheese Day";
	else if (date ==  "7/6" ) holiday = "Smoke Fest";
	else if (date ==  "7/12") holiday = "The Starshine";
	else if (date ==  "7/28") holiday = "Awakening Night";
	else if (date ==  "7/31") holiday = "Scribe's Eve";
	else if (date ==  "8/1" ) holiday = "Scribe's Fest"; //hehe
	else if (date ==  "8/19") holiday = "Aqueve";
	else if (date ==  "8/20") holiday = "Aqua Day"; //hehehe
	else if (date ==  "8/25") holiday = "Red Day";
	else if (date ==  "9/8" ) holiday = "Undassi";
	else if (date ==  "9/14") holiday = "Polomeia's Fest";
	else if (date ==  "9/18") holiday = "The West Enchanting";
	else if (date ==  "9/30") holiday = "Melody's Eve";
	else if (date == "10/1" ) holiday = "Melody Fest"; //hehehehe
	else if (date == "10/9" ) holiday = "Green Moon Day";
	else if (date == "10/13") holiday = "Tensfier";
	else if (date == "10/23") holiday = "Harvest Feast";
	else if (date == "11/5" ) holiday = "Parchwrym Day";
	else if (date == "11/10") holiday = "Chaos Eve";
	else if (date == "11/11") holiday = "Chaos Fest"; //hehehehehe
	else if (date == "11/26") holiday = "Hearth's Fest";
	else if (date == "12/13") holiday = "Frost Fest";
	
	return holiday;
}