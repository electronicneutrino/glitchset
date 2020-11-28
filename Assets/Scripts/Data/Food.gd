extends Node

# food properties
const name_property = "name"; 
const icon_property = "icon"; 
const type_property = "type";

const energy_property = "energy"; 
const stability_property = "stability";

const gene_type_property = "category";
const gene_num_property = "number"; 


const Basic_strawberry = "strawberry"; 
const Basic_banana = "banana"; 

const Gene_boredEyes = "boredEyes"; 



var foodData : Dictionary = {
	Basic_strawberry: {
		name_property: "strawberry",
		type_property: Enums.FoodTypes.BASIC,
		icon_property: "sword1.png",
		energy_property: 5, 
		stability_property: 5
	},
	Basic_banana: {
		name_property: "Banana222",
		type_property: Enums.FoodTypes.BASIC,
		icon_property: "sword2.png",
		energy_property: 5, 
		stability_property: 5
	},
	Gene_boredEyes: {
		name_property: "boredEyes", 
		type_property: Enums.FoodTypes.GENE,		
		icon_property: "aaa.png",
		gene_type_property: Enums.Genes.EYE,
		gene_num_property: Enums.Eyes.BORED
	}
}

