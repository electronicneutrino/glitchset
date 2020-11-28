extends Scene

onready var eggSprite = $YSort/Nest/Egg
onready var nest = $YSort/Nest; 

func _ready():
	ySort = $YSort; 
	GameData.curLocation = Enums.Places.HOME;
	Player.set_scene(self);
	for item in GameData.creatureList:
		ySort.add_child(item); 
#	add_child(Player.playerNode); # added via gamecreature list
	add_child(Player.cameraNode); 
	add_child(Player.canvasNode); 

func leave(): 
	remove_child(Player.canvasNode); 
	remove_child(Player.cameraNode); 
	for item in GameData.creatureList:
		ySort.remove_child(item); 

func save_home():
	pass 

func set_egg_visibility(visible): 
	nest.set_egg_visibility(visible); 
	pass
	
