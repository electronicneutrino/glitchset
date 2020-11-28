extends MarginContainer


const camera = preload("res://Assets/Camera/Camera2D.tscn"); 

func _ready():
	pass


func _on_Play_pressed():
	var saveDataExists = false; 
	if saveDataExists:
		pass
	else: 
		GameData.new_game(); 
