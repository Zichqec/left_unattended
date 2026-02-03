//———————————————————— Generic commu response ————————————————————
//————— Initial response —————
talk CommunicateTalkInitial(ghost)
{
	\s[tongue]Yo, what's happening {ghost}?
}

talk CommunicateTalkInitial(ghost)
{
	\s[tongue]Heyyy {ghost}, how's it going?
}

talk CommunicateTalkInitial(ghost)
{
	\s[tongue]Glad to see you here, {ghost}.
}


//————— Followup if they reply back —————
talk CommunicateTalkFinal(ghost)
{
	\s[laugh]Hope you're enjoying the party~
}

talk CommunicateTalkFinal(ghost)
{
	\s[laugh]We'll have to catch up sometime~
}

talk CommunicateTalkFinal(ghost)
{
	\s[laugh]I'm a little busy managing the party right now, but catch me after {thecheesecake} gets here, alright?
}


//———————————————————— Needle poke Jes ————————————————————
talk OnJesNeedlePoke
{
	\s[anger]Stop it.
}


//———————————————————— Give Jes cake (via Birthday Needle) ————————————————————
talk OnJesGiveCake
{
	\s[eyeroll]\i[10]Yes, yes, the cake is delicious. \s[phone]Eat it and let me work here for a bit, okay?
}

//———————————————————— Spectre possession ————————————————————
function OnSpectrePlugin@ConfirmCalibration
{
	return "\![raiseplugin,Spectre,OnCustomCalibrationConfirm,--option=include,normal,smile,angry,thinking,indignant,unamused]";
}

function OnSpectrePlugin@Surface
{
	if (Shiori.Reference[0] == "normal") return "\s[forward]";
	else if (Shiori.Reference[0] == "smile") return "\s[laugh]";
	else if (Shiori.Reference[0] == "angry") return "\s[anger]";
	else if (Shiori.Reference[0] == "thinking") return "\s[away]";
	else if (Shiori.Reference[0] == "indignant") return "\s[annoyed]";
	else if (Shiori.Reference[0] == "unamused") return "\s[eyeroll]";
}

function OnSpectrePlugin@Possession
{
	if (Random.GetIndex(0,4) == 0)
	{
		return Reflection.Get("SpectreTalk");
	}
}

talk SpectreTalk
{
	\s[eyeroll]... Did someone just leave?
}


//———————————————————— LOBO howl ————————————————————
function OnLoboHowlStart
{
	//pain		!? 12
	//sad		... 13
	//hopeful	cheerful 16
	//strange	? 11
	//vulgar	annoyed 17 / anger 18 also possible here...
	//normal	! 10
	
	local animation = "";
	if (Shiori.Reference[0] == "pain") animation = "12";
	else if (Shiori.Reference[0] == "sad") animation = "13";
	else if (Shiori.Reference[0] == "hopeful") animation = "16";
	else if (Shiori.Reference[0] == "strange") animation = "11";
	else if (Shiori.Reference[0] == "vulgar") animation = "17";
	else if (Shiori.Reference[0] == "normal") animation = "10";
	
	local output = "";
	if (BalloonIsOpen()) output += "\C";
	foreach (thing in PartyClutter)
	{
		if (thing.type == "guest") output += "\_w[{Random.GetIndex(1,3)}00]\p[{thing.p}]\s[{thing.surface}]\i[{animation}]";
	}
	
	return output;
}


//———————————————————— Can toss ————————————————————
talk OnCanToss
{
	\s[anger]Um, I'm in the middle of a party. \s[eyeroll]\i[10]It's not my fault you decided to get groceries today. \s[phone]Put them away yourself.
}