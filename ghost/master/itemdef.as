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
		{surface: "60100", name: "PottedFern"},
	];
}