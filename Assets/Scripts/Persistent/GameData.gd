extends Node

const Creature = preload("res://Assets/Creatures/Creature.tscn"); 

var curLocation; 

var curPlayer; # Creature object, but circular dependence

var creatureList: Array; 

var inventory; 

var savedGame : bool = false; 

const canvasNode = preload("res://Assets/UI/UI.tscn"); 

const camera = preload("res://Assets/Camera/Camera2D.tscn"); 

func _ready():
	# look for saved games 
	pass

func continue_game(map): 
	start_game(); 
	
func new_game(): 
	start_game(); 
	curPlayer = Creature.instance(); 
	curPlayer.randomize_basic();  # it creatures the new and set_as_active
	curPlayer.set_as_active(); 
	creatureList.append(curPlayer); 
	pass 

func start_game():
	get_tree().change_scene("res://Assets/Worlds/test.tscn");
	var uiCanvas =  canvasNode.instance();
	var cameraObject = camera.instance(); 
	Player.sceneNode.add_child(cameraObject); 
	Player.sceneNode.add_child(uiCanvas); 
	
func save_game(): 
	# save current world
	# Save inventory
		# save egg
	# save lux count
	# save active creature
	# save creatures
		# name
		# heath
	var save_data = {}; 
	pass
