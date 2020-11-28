extends Node2D

onready var eggSprite = $Egg; 
var active : bool = false; 
var selected : bool = false;

func _ready():
	if not HomeData.hasEgg: 
		eggSprite.visible = false; 
	pass
	
func _process(delta):
	if Player.in_range(position): 
		if eggSprite.is_pixel_opaque(get_local_mouse_position()):
			eggSprite.modulate = Color.lightblue; 
			selected = true; 
			return; 
	if selected: 
		eggSprite.modulate = Color.white; 
		selected = false; 
		
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT: 
		if HomeData.hasEgg and eggSprite.is_pixel_opaque(get_local_mouse_position()) and selected:
			HomeData.hatch_egg(); 
			

func set_egg_visibility(visibility): 
	eggSprite.visible = visibility;
