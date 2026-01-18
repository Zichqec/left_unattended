//———————————————————— Needle poke Jes ————————————————————
talk OnJesNeedlePoke
{
	\s[anger]Stop it.
}


//———————————————————— Spectre responses ————————————————————
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