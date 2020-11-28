extends Camera2D


onready var target = Player.playerNode; 

func _ready():
	Player.set_camera(self); 

func _process (delta): 
	#change, very jittery. Maybe when get to edge, we follow player and drift to center
	position = target.position; 

func set_target(newTarget): 
	target = newTarget; 
