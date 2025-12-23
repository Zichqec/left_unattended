function GuestTypes
{
	return [
		{surface: "10000", name: "Regular"},
		{surface: "10100", name: "HornsEars"},
	];
}

function LeftDeco
{
	return [
		{surface: "20000", name: "SideBanner"},
		{surface: "20100", name: "SideBalloons"},
		{surface: "20200", name: "LeftSpeaker"},
	];
}

function TopDeco
{
	return [
		{surface: "30000", name: "TriangleString"},
		{surface: "30100", name: "HappyPartyBanner"},
	];
}

function RightDeco
{
	return [
		{surface: "40000", name: "Dartboard"},
		{surface: "40100", name: "SideFern"},
		{surface: "40200", name: "RightSpeaker"},
	];
}

function BottomDeco
{
	return [
		{surface: "50000", name: "WeightedBalloons"},
		{surface: "50100", name: "SpotLights"},
		{surface: "50200", name: "PunchBowl", variants: [
			{surface: "50200", special: null},
			{surface: "50201", special: null},
			{surface: "50250", special: null},
			{surface: "50251", special: "candy bowl"},
		]},
	];
}

function FreeDeco
{
	return [
		{surface: "60000", name: "CakeTable"},
		{surface: "60100", name: "PottedFern", variants: [
			{surface: "60100", special: null},
			{surface: "60101", special: null},
			{surface: "60102", special: null},
			{surface: "60103", special: null},
			{surface: "60104", special: null},
		]},
		{surface: "60200", name: "BouncyCastle"},
	];
}