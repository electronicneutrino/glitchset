extends Sprite

var selected : bool = false;

var testScene; 
func _ready():
	pass
	
func _process(delta):
	if Player.in_range(position):
		if is_pixel_opaque(get_local_mouse_position()):
			modulate = Color.lightblue; 
			selected = true; 
			return; 
	if selected: 
		modulate = Color.white; 
		selected = false; 
	
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT: 
		if is_pixel_opaque(get_local_mouse_position()) and selected:
			# save state of HOME
			if GameData.curLocation == Enums.Places.HOME:
				Player.sceneNode.save_home();
				for item in GameData.creatureList:
					Player.sceneNode.remove_child(item); 
			Player.go_to_world(Enums.Places.TEST, "res://Assets/Worlds/test.tscn")
