extends Node

var eggData; # object of type Egg
var hasEgg : bool = false;
var treeList : Array;

 
func _ready():
	pass

func place_egg(newEgg):
	if hasEgg:
		Inventory.add(eggData); 
	eggData = newEgg; 
	Player.sceneNode.set_egg_visibility(true); 
	hasEgg = true; 
	pass

func hatch_egg():
	if hasEgg: 
		eggData.hatch(); 
		Player.sceneNode.set_egg_visibility(false);  
		hasEgg = false; 

func load_home():
	pass
