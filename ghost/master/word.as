function bagsofglitter
{
	return Random.Select([
		"bags of {redandblue} glitter",
		"custom-printed cardboard cutouts",
		"fog machines",
		"marble cakes",
		"cute cake toppers",
		"cakes with custom printed designs on top",
		"bubble machines",
		"projectors",
		"water guns",
		"extra spicy nachos",
		"spray paint",
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
		"metallic",
		"chunky",
		"flakey",
		"iridescent",
	]);
}

function pictureframesare
{
	return Random.Select([
		"picture frames are",
		"rest of the balloons are",
		"next cake is",
		"big disco ball is",
		"life sized gummy elephant is",
		"talking dog is",
		"big vat of {blueberry} punch is",
		"pallet of eggs is",
		"giant cake sculpture is",
		"ice sculptures are",
	]);
}

function blueberry
{
	return Random.Select([
		"blueberry",
		"raspberry",
		"green apple",
		"lemon",
		"grape",
		"watermelon",
		"orange",
		"strawberry",
		"blackberry",
		"kiwi-lime",
	]);
}

function soda
{
	return Random.Select([
		"soda",
		"sparkling cider",
		"snacks",
		"paper plates",
		"plastic forks",
		"plastic cups",
		"napkins",
		"mustard",
		"ketchup",
		"sprinkles",
	]);
}

function morestreamers
{
	return Random.Select([
		"more streamers",
		"another banner",
		"another sandwich platter",
		"another chocolate fountain",
		"more candles",
		"another cake",
		"more speakers",
		"more lights",
		"another table",
		"more cookies",
	]);
}

function thecheesecake
{
	return Random.Select([
		"the cheesecake",
		"the jukebox",
		"the ambassador",
		"the extra subwoofer",
		"the giant cheese wheel",
		"the jacuzzi",
		"the new TV",
		"the clown",
		"the giant tray of cupcakes",
		"the arcade machine",
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
		"hotdog plush",
		"airhorn",
		"set of party poppers",
		"throw rug",
		"jar of sprinkles",
		"fog machine",
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
		//"many guests", //Commenting this because it makes merchant's one dialogue weird lol, and I don't think it adds *that* much...
		"many napkins",
		"many balloons",
	]);
}

function plushsushi
{
	return Random.Select([
		"plush sushi",
		"miniature party hats",
		"glowstick necklaces",
		"sticker packs",
		"bubble bottles",
		"pinwheels",
		"glitter pens",
		"pencil toppers",
		"themed erasers",
		"miniature jars",
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
		"enough hot dog buns",
		"enough ketchup",
		"enough napkins",
		"enough glitter",
		"jello molds",
	]);
}

function vanilla
{
	return Random.Select([
		"vanilla",
		"chocolate",
		"peanut butter",
		"fudge",
		"mint",
		"caramel",
		"pistachio",
		"cookie dough",
		"neapolitan",
		"rocky road",
		"cookies and cream",
	]);
}

function warmandinviting
{
	return Random.Select([
		"warm and inviting",
		"thematic",
		"cool and hip",
		"stylish",
	]);
}

function thesestreamers
{
	return Random.Select([
		"these streamers",
		"these balloons",
		"a box cake mix",
		"that sorry-looking potted plant",
		"that rug",
		"these plastic cups",
		"these napkins",
		"these individually wrapped plastic cutlery sets",
		"these festive toothpicks",
	]);
}

function punch
{
	return Random.Select([
		"punch",
		"jello",
		"pudding",
		"cake",
		"ice cream",
		"bread",
		"cupcakes",
		"napkins",
		"cups",
	]);
}

function thesecheapnapkins
{
	return Random.Select([
		"these cheap napkins",
		"a slight deficiency of {punch}",
		"an insufficient variety of balloon colors",
		"a lack of {plushsushi}",
		"the choice of plastic cups",
		"the lack of colorful lighting choices",
	]);
}

//used in combination with a fruit flavor
function jello
{
	return Random.Select([
		"jello",
		"pie",
		"cheesecake",
		"pudding",
		"ice cream",
		"frozen yogurt",
		"ice pops",
		"tarts",
		"candies",
	]);
}

function balloons
{
	return Random.Select([
		"balloons",
		"confetti",
		"cake",
		"cupcakes",
		"ice cream",
		"party hats",
		"plastic cups",
		"paper plates",
		"plastic cutlery",
	]);
}

function partytext
{
	return Random.Select([
		"don't mind... my roommate...",
		"we have snacks... and games...",
		"there is cake... and more on the way...",
		"free drinks... and cups...",
		"stay all night... no noise limit...",
		"no admission fee... (but donations appreciated...)\w8\w8",
		"bring your own... party hat...",
		"costumes okay... but not required...",
		"bring your friends... and their friends...",
		"loud music... requests welcome...",
		"lots of floor space... if you get tired...",
		"make new friends... and enemies...",
		"lots of activities... fun for all...",
		"dance shoes encouraged... but not required...",
		"photos with me... and autographs...",
		"complementary boxes... take one when you leave...",
		"fast wifi... password: {password}...",
		"limitless... water bar...",
		"nap anywhere... anytime...",
		"no bugs... unless they're cute...",
	]);
}

//This is not password advice lol
function password, OnT
{
	local output = Random.Select([
		"C4keC4keC4ke",
		"c4keT1me",
		"Frosting4dayz",
		"Sug4ryG00dness",
		"Lord0fC4ke",
		"icing2meetU",
		"Fr3shB4ked",
		"NoFakeC4kesAllowed",
		"SuperC4ke",
		"EveryDay1sSomeonesB1rthday",
		"H0ldMySl1ce",
	]);
	
	//These make too many numbers...
	//output = output.Replace("a","4");
	//output = output.Replace("e","3");
	//output = output.Replace("s","5");
	//output = output.Replace("i","1");
	//output = output.Replace("t","7");
	//output = output.Replace("o","0");
	
	output += Random.GetIndex(0,10);
	output += Random.Select([
		"!",
		"@",
		"#",
		"$",
		"%",
		"&",
		"*",
		"+",
	]);
	
	return output;
}

function trayofcookies
{
	return Random.Select([
		"tray of cookies",
		"cake",
		"bottle of ketchup",
		"bottle of mustard",
		"punch bowl",
		"bouncy castle fan",
		"spool of balloon string",
		"helium tank",
		"bag of balloons",
		"box of candles",
		"ladle",
	]);
}

function surroundsoundsystem
{
	return Random.Select([
		"surround sound system",
		"chocolate fountain",
		"laser star projector",
		"drone with party lights",
		"jumbo pack of 10,000 ultra-brite glowsticks",
		"inflatable plastic pool",
		"cotton candy machine",
		"giant cake poster",
		"gigantic solid-chocolate bunny",
		"custom programmable outdoor LED sign",
	]);
}

function tinysugarcookies
{
	return Random.Select([
		"tiny sugar cookies with chocolate faces",
		"tiny fruit sticks",
		"tiny fruit-shaped candies",
		"cat-shaped cookies",
		"teeny little party hats",
		"sparkly balloon stickers",
		"cake-shaped birthday candles",
		"fruit-shaped balloons",
		"little tarts with animal faces on them",
		"teeny tiny cinnamon rolls",
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