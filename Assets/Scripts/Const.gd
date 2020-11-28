extends Node

const penguinPath = "res://Assets/Creatures/Penguin/"
const bunPath = "res://Assets/Creatures/Bun/"

var spritePaths : Dictionary = { 
	Enums.Species.PENGUIN: penguinPath,
	Enums.Species.BUN: bunPath
}

var speciesRarity: Dictionary = {
	Enums.Species.PENGUIN: 0.5, 
	Enums.Species.BUN: 1
}

var patternRarity : Dictionary = {
	Enums.Patterns.SOLID: 1,
	Enums.Patterns.CRACKLE: 0.5, 
	Enums.Patterns.STARS: 0.1,
	Enums.Patterns.PIEBALD: 1 ,
	Enums.Patterns.WATER: 0.5,
	Enums.Patterns.SCALES: 0.5,
	Enums.Patterns.CRYSTAL: 0.5,
	Enums.Patterns.STITCHED: 0.5,
	Enums.Patterns.SATIN: 0.1,
	Enums.Patterns.SKETCHED: 0.5, 
}

var eyesRarity : Dictionary = {
	Enums.Eyes.BASIC: 1,
	Enums.Eyes.GLITTER: 0.5,
	Enums.Eyes.SERIOUS: 0.5,
	Enums.Eyes.BORED: 1,
	Enums.Eyes.SAD: 0.5,
	Enums.Eyes.HAPPY: 0.5,
	Enums.Eyes.ELEMENTAL:0.1,
	Enums.Eyes.GOAT:0.1,
	Enums.Eyes.COMPOUND:0.1,
}

var tailRarity : Dictionary = {
	Enums.Tail.SHORT: 1,
	Enums.Tail.LONG: 1,
	Enums.Tail.CURLY: 0.5,
	Enums.Tail.GEM: 0.1,
	Enums.Tail.ROPE: 0.5,
	Enums.Tail.CELESTIAL: 0.1,
	Enums.Tail.CLOUD: 0.5,
	Enums.Tail.POOF: 1,
	Enums.Tail.FAN: 0.5
}

var featuresRarity : Dictionary = {
	Enums.Features.BASIC: 1,
	Enums.Features.UNICORN: 0.5,
	Enums.Features.WINGS_FEATHER: 0.5,
	Enums.Features.PLANT: 0.5,
	Enums.Features.STARS : 0.1,
	Enums.Features.GEM: 0.1
}

var equalRarity; 

var speciesString : Dictionary = {
	Enums.Species.PENGUIN: "Penguin",
	Enums.Species.BUN: "Bun"
}

var patternString : Dictionary = {
	Enums.Patterns.SOLID: "Solid",
	Enums.Patterns.CRACKLE: "Crackle", 
	Enums.Patterns.STARS: "Stars",
	Enums.Patterns.PIEBALD: "Piebald",
	Enums.Patterns.WATER: "Water",
	Enums.Patterns.SCALES: "Scales",
	Enums.Patterns.CRYSTAL: "Crystal",
	Enums.Patterns.STITCHED: "Stitched",
	Enums.Patterns.SATIN: "Satin",
	Enums.Patterns.SKETCHED: "Sketched", 
}

var eyesString : Dictionary = {
	Enums.Eyes.BASIC: "Basic",
	Enums.Eyes.GLITTER: "Glimmer",
	Enums.Eyes.SERIOUS: "Serious",
	Enums.Eyes.BORED: "Bored",
	Enums.Eyes.SAD: "Sad",
	Enums.Eyes.HAPPY: "Happy",
	Enums.Eyes.ELEMENTAL:"Elemental",
	Enums.Eyes.GOAT: "Goat",
	Enums.Eyes.COMPOUND:"Compound",
}

var tailString : Dictionary = {
	Enums.Tail.SHORT: "Short",
	Enums.Tail.LONG: "Long",
	Enums.Tail.CURLY: "Curly",
	Enums.Tail.GEM: "Gem",
	Enums.Tail.ROPE: "Rope",
	Enums.Tail.CELESTIAL: "Celestial",
	Enums.Tail.CLOUD: "Cloud",
	Enums.Tail.POOF: "Poof",
	Enums.Tail.FAN: "Fan"
}

var featuresString : Dictionary = {
	Enums.Features.BASIC: "None",
	Enums.Features.UNICORN: "Unicorn",
	Enums.Features.WINGS_FEATHER: "Wings",
	Enums.Features.PLANT: "Plant",
	Enums.Features.STARS : "Stars",
	Enums.Features.GEM: "Gem"
}

