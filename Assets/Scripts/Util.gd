extends Node

func get_random_int(minNum, maxNum): 
	randomize(); 
	return floor(randf()*(maxNum-minNum))+minNum;

func get_random_float():
	randomize(); 
	return randf(); 
	
func get_with_rarity(dictionary): 
	var newArray : Array; 
	var chance = get_random_float();
	for item in dictionary: 
		if chance < dictionary[item]: 
			newArray.append(item); 
	var result = get_random_int(0, newArray.size()); 
	return newArray[result];
	
