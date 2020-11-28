var geneSet1 : Gene; 
var geneSet2 : Gene = Gene.new(); 
var parent; 

var Creature = preload("res://Assets/Creatures/Creature.tscn")
func set_genes(genes):
	geneSet1 = genes;

func set_parent(creature):
	parent = creature; 

func hatch():
	geneSet2.meiosis(Player.playerNode.mainGenes, Player.playerNode.recGenes)
	Player.is_interacting(Enums.Actions.HATCH); 
	var newCreature = Creature.instance(); 
	newCreature.set_phenotype(geneSet1, geneSet2); 
	Player.sceneNode.add_ysort_child(newCreature); 
	print(newCreature.position); 
	GameData.creatureList.append(newCreature); 
	# can we like. main genes to be meiosis on gene sets 
	# and rec also meiosis on gene sets

func save(): 
	pass
