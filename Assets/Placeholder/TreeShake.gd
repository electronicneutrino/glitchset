extends KinematicBody2D 

var selected : bool = false; 

var active : bool = false; 
var randNum : float = 0.0; 
var despawn : bool = false;
var despawnRate : float = 0.5; 
var spawnTime : int = 5; 

var requiredAbility: int = Enums.Actions.SHAKE; 

var drops : Dictionary;

onready var timer = $Timer;

func _ready():
	timer.wait_time = spawnTime; 
	timer.start(); 
	randomize(); 
	drops = TreeDrops.testTree; 
	randNum = randf();  
	if randNum<despawnRate:
		despawn = true; 

func _process(delta):
	# this does this because enter only works for collision
	# but we want to over anywhere on the object
	if Player.in_range(position):
		if $Sprite.is_pixel_opaque(get_local_mouse_position()):
			if active:
				if requiredAbility==Player.ability:
					modulate = Color.lightgreen;
				else: 
					modulate = Color.lightcoral; 
			else: 
				modulate = Color.lightpink; 
			selected = true; 
			return; 
	if selected:
		modulate = Color.white;
		selected = false; 
#	pass

func _input(event):
	if selected:
		var clickEvent = event is InputEventMouseButton; 
		var hasAction = requiredAbility==Player.ability; 
		if clickEvent and event.button_index == BUTTON_LEFT and hasAction: 
			print("clicked!!"); 
			get_tree().set_input_as_handled(); 
			if active:
				Player.is_interacting(requiredAbility);
				Player.handle_drops(drops); 
				active = false; 
				timer.start()

func _on_Timer_timeout():
	if active: 
		if despawn: 
			active = false;
			timer.wait_time = 5; 
		else: 	
			timer.stop();    
	else:
		active = true; 
		timer.wait_time = spawnTime
		randomize(); 
		randNum = randf();  
		if randNum<despawnRate:
			despawn = true; 
		else: 
			despawn = false; 
		

