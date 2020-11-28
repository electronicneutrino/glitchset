extends TextureButton

var item; 
var count; 
var type; 

onready var textLabel = $Label; 

func add_item():
	count+=1; 
	update_icon_display();

func remove_item():
	count -=1; 
	if count == 0: 
		Inventory.items.erase(item); 
		queue_free();
	else: 
		update_icon_display();  
		
func update_icon_display():
	if Food.foodData.has(item): 
		type = Enums.itemTypes.FOOD; 
		textLabel.text = Food.foodData[item][Food.name_property] + " x"+  str(count);
	elif Decor.decorData.has(item):
		type = Enums.itemTypes.DECOR; 
		textLabel.text = Decor.decorData[item][Decor.name_property] + " x" + str(count);  
	else: # not decor and not food. Eggs and single use items
		type = Enums.itemTypes.EGG; 
		pass
	
func set_content(newItem):
	item = newItem; 
	count = 1; 
	update_icon_display(); 

func _on_TextureButton_pressed():
	if type == Enums.itemTypes.FOOD:
		Player.consume(item); 
	elif type == Enums.itemTypes.DECOR:
		pass
	elif type == Enums.itemTypes.EGG: 
		if GameData.curLocation == Enums.Places.HOME:
			HomeData.place_egg(item); 
		else: 
			return; 
	remove_item(); 

