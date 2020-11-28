extends Control

const label = preload("res://Assets/UI/Item.tscn");
var labelList : Array; 
onready var scrollContainer = $Items/Control; 


func _ready():
	Inventory.set_ui(self); 
		
func add_item(item): 
	var newLabel = label.instance(); 
	labelList.append(newLabel);
	scrollContainer.add_child(newLabel); 
	newLabel.set_content(item);
	return newLabel; 
	
func update_item(item):
	pass

func remove_from_list(label):
	var index = labelList.find(label); 
	labelList.remove(index); 
