extends Sprite

func _ready():
	pass
	
func set_type(type): 
	# we're gonna want to make this able to change dependent on species eventually
	texture = load(Consts.penguinPath +"Eyes/" + str(type) + ".png"); 
