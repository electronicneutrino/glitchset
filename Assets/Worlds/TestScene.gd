extends Scene

const canvasNode = preload("res://Assets/UI/UI.tscn"); 
func _init():
	Player.set_scene(self); 
	GameData.curLocation = Enums.Places.TEST;

func _ready():
	ySort = $YSort; 
	if Player.playerNode!=null:
		ySort.add_child(Player.playerNode); 
		add_child(Player.cameraNode); 
		add_child(Player.canvasNode); 
	$TileMap.start();

func leave(): 
	remove_child(Player.canvasNode); 
	remove_child(Player.cameraNode); 
	ySort.remove_child(Player.playerNode);  #only removes direct children
		# I think?
		

func add_ysort_child(item): 
	ySort.add_child(item); 
	
#	curNode.queue_free()
#	curNode.replace_by(GameData.curPlayer)
