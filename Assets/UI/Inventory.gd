extends Control

var mouseOver : bool = false; 
var items : Dictionary; # item name + count
var basicFoodItems : Dictionary; 
var advFoodItems : Dictionary; 
var geneFoodItems : Dictionary; 
var miscFoodItems : Dictionary; 
var eggList : Array; 
var inventoryUI; 

var Egg = load("res://Assets/Creatures/Egg.gd");
func _ready():
	pass
	
func set_ui(uiNode):
	inventoryUI = uiNode; 
	
func get_list(type):
	if type == Enums.FoodTypes.BASIC:
		return basicFoodItems; 
	elif type == Enums.FoodTypes.ADVANCED:
		return advFoodItems;
	elif type == Enums.FoodTypes.GENE:
		return geneFoodItems;
	elif type == Enums.FoodTypes.MISC:
		return miscFoodItems;

func add(item):
	if items.has(item): 
		items[item].add_item();  
		pass
	else:  
		items[item] = inventoryUI.add_item(item); 
	print(items); 

func remove(item): 
	if items.has(item): 
		items[item].remove_item()
	else: 
		print("You don't have this item!"); 

func add_new_egg(genes): 
	var egg = Egg.new(); 
	egg.set_parent(Player.playerNode); # probably only need a sprite and name
	egg.set_genes(genes); 
	items[egg] = inventoryUI.add_item(egg); 
#	eggList.append(egg); 
	pass

func remove_egg(item):
	eggList.erase(item); 
	pass 
