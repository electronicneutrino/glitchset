extends Node2D

enum Species {
	PENGUIN, 
	BUN 
}

enum Genes {
	SPECIES,
	PRIM_COLOR,
	SEC_COLOR,
	TER_COLOR,
	PATTERN,
	EYE,
	FEATURE, 
	TAIL, 
	COLD_PROOF, 
	HEAT_PROOF, 
	DRY_PROOF, 
	WET_PROOF
}

enum Eyes {
	BASIC,
	GLITTER,
	SERIOUS,
	BORED,
	SAD,
	HAPPY,
	ELEMENTAL,
	GOAT,
	COMPOUND
}

enum Actions {
	ATTACK,
	PICK_UP,
	DIG,
	SHAKE,
	DIVE,
	SEARCH, 
	HATCH
}

enum Tail {
	SHORT,
	LONG,
	CURLY,
	GEM,
	ROPE,
	CELESTIAL,
	CLOUD,
	POOF,
	FAN
}

enum Patterns {
	SOLID,
	STARS,
	PIEBALD,
	WATER,
	SCALES,
	CRACKLE,
	CRYSTAL,
	STITCHED,
	SATIN,
	SKETCHED
}


enum Colours { # 24 or 36 
	WHITE, 
	CREAM, 
	SAFFRON, 
	LEMON, 
	GOLD, 
	PEACH, 
	ORANGE, 
	STRAWBERRY, 
	ROSE, 
	RUBY, 
	FUSHIA, 
	GRAPE, 
	LAVANDER, 
	INDIGO, 
	TEAL,
	NAVY, 
	SKY,
	AQUA, 
	FOREST,
	LIME, 
	SPRING,
	MOSS,
	BROWN,
	COFFEE,
	BLACK,
	STORM,
	CLOUD,
	GREY
}

enum Flavours {
	SWEET,
	SALTY,
	BLAND,
	SPICY,
	BITTER,
	SOUR
}

enum Textures {
	SOFT,
	CRUNCHY,
	STICKY,
	DRY,
	SMOOTH,
	CHEWY, 
	TOUGH,
	JUICY
}

enum Features{
	BASIC,
	UNICORN,
	WINGS_FEATHER,
	#INSECT WINGS,
	PLANT,
	STARS,
	GEM,
	POOF,
	GLOW
}

enum FoodTypes{
	BASIC,
	ADVANCED,
	GENE, 
	MISC # stuff like bonuses or gene tests
}

enum DecorTypes{
	BLOCK,
	AESTHETIC, 
	FUNCTIONAL
}

enum itemTypes{
	FOOD,
	DECOR,
	EGG,
	MISC 
}

enum Places{
	HOME, 
	TEST
}

