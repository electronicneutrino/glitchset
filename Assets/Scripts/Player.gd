extends KinematicBody2D

# from creatureData 
#var creatureData; 
var ability : int = Enums.Actions.SHAKE; 
var maxEnergy : int = 100;
var curEnergy : float = 100.00;
var maxStability : int = 100;
var curStability : float = 0.0;  
var curLevel : int = 0;
var curXp : int = 0;
var xpToNextLevel : int = 50;
var moveSpeed : int = 250;
var damage : int = 10;
var defense : int = 3; 

# from environment 
var stabilityRate : float = 0.2; 
var energyRate : float = 0.1;
var stopTimedDecay : bool = false; 

# shared between all; Player
var lux : int = 0;
var interactDist : int = 100;

# local for functions
var isDamaged : bool = false;
const damageTime = 0.5; # timeout due to damage

var uiNode;
var canvasNode; 
var sceneNode; 
var cameraNode; 

#has three timers for reasons? 

# player stuff
var playerNode;

func _ready():
	pass
	
func set_camera(camera): 
	cameraNode = camera; 

func set_active(creature):
	if playerNode: # save the info to the last creature
		print("SETting active false"); 
		playerNode.curEnergy = curEnergy; 
		playerNode.curStability = curStability; 
		playerNode.curLevel = curLevel; 
		pass
	playerNode = creature; 
	curEnergy = creature.curEnergy; 
	curStability = creature.curStability; 
	curLevel = creature.curLevel; 
	if cameraNode:
		cameraNode.set_target(playerNode); 
	if uiNode: 
		update_ui(); 
		update_profile(); 
	pass

func set_ui(item): 
	uiNode = item; 
	uiNode.update_lux_text(lux); 
	update_ui();
	timedDecay(5); 
	
func update_ui(): 
	uiNode.update_level_text(curLevel);
	uiNode.update_health_bar(curEnergy, maxEnergy);
	uiNode.update_xp_bar(curXp, xpToNextLevel);
	uiNode.update_stability_bar(curStability, maxStability);
	uiNode.update_health_bar(curEnergy, maxEnergy);

func update_profile(): 
	uiNode.update_profile_text(playerNode.mainGenes, playerNode.recGenes); 

func set_canvas(item):
	canvasNode = item; 
	sceneNode.remove_child(canvasNode);

func in_range(position): 
	if playerNode.position.distance_to(position)>interactDist:
		return false; 
	else: 
		return true; 

func is_interacting(action):
	if action == Enums.Actions.ATTACK:
		if not isDamaged:
			playerNode.colorForTime(Color.aqua, 1);  
	elif action == Enums.Actions.SHAKE:
		playerNode.colorForTime(Color.lightskyblue, 1); 
	elif action == Enums.Actions.HATCH: 
		playerNode.colorForTime(Color.lightgreen, 1);

func refillStability(value):
	var amount = -value; 
	updateStability(amount);
	
func refillEnergy(value): 
	var amount = value; 
	updateEnergy(amount); 
	
func updateStability(value):
	var newValue = curStability+value; 
	if newValue<0:
		newValue = 0; 
	elif newValue > maxStability: 
		newValue = maxStability; 
	curStability = newValue; 
	uiNode.update_stability_bar(curStability, maxStability);
	
func updateEnergy(value):
	var newValue = curEnergy+value; 
	if newValue<0:
		newValue = 0; 
	elif newValue > maxEnergy: 
		newValue = maxEnergy; 
	curEnergy = newValue; 
	uiNode.update_health_bar(curEnergy, maxEnergy);

func get_damage():
	if not isDamaged:
		return damage;
	else:
		return 0;
	
func give_lux(amount):
	lux+=amount;
	uiNode.update_lux_text(lux);
	
func give_xp(amount):
	curXp+=amount;
	if curXp>= xpToNextLevel:
		level_up()
	uiNode.update_xp_bar(curXp, xpToNextLevel);

func level_up():
	var overflowXp = curXp - xpToNextLevel;
	curXp = overflowXp; 
	curLevel+=1;
	uiNode.update_level_text(curLevel);
	uiNode.update_xp_bar(curXp, xpToNextLevel);
	var eggGenes = Gene.new(); 
	eggGenes.meiosis(playerNode.mainGenes, playerNode.recGenes);
	Inventory.add_new_egg(eggGenes); 
	
func take_damage(dmgToTake):
	disableForTime(damageTime);
	playerNode.colorForTime(Color.red, damageTime); 
	updateEnergy(-float(dmgToTake)/float(defense))
	print("Cur energy"); 
	print(curEnergy);
	updateStability(dmgToTake); 
	if curEnergy <= 0 or curStability >= maxStability: 
		die();

func die():
	curEnergy = 100; 
	curStability = 0; 
	print("Hello??")
	go_home(); 
	
func go_home():
	go_to_world(Enums.Places.HOME,"res://Assets/Worlds/Home.tscn" )

func go_to_world(worldEnum, scenePath): 
	if GameData.curLocation != worldEnum:
		sceneNode.leave(); 
		get_tree().change_scene(scenePath);

func disableForTime(waitTime):
	isDamaged = true;
	var t = Timer.new();
	t.set_wait_time(waitTime);
	t.set_one_shot(true);
	self.add_child(t);
	t.start();
	yield(t, "timeout");
	t.queue_free()
	isDamaged = false;

func timedDecay(waitTime): 
	updateStability(stabilityRate); 
	updateEnergy(energyRate);
	var t = Timer.new();
	t.set_wait_time(waitTime);
	t.set_one_shot(true);
	self.add_child(t);
	t.start();
	yield(t, "timeout");
	t.queue_free();
	if not stopTimedDecay:
		timedDecay(waitTime); 

func getRange():
	return 100; 

func handle_drops(drops):
	randomize();
	var dropItem = Utils.get_with_rarity(drops); 
	Inventory.add(dropItem); 
	# add to inventory

func consume(item):
	var itemData = Food.foodData[item]; 
	if itemData[Food.type_property] == Enums.FoodTypes.BASIC:
		refillStability(itemData[Food.stability_property]);
		refillEnergy(itemData[Food.energy_property]);
	elif itemData[Food.type_property] == Enums.FoodTypes.GENE:
		playerNode.apply_genes(itemData[Food.gene_type_property], 
			itemData[Food.gene_num_property]); # what property and the number 
		update_profile();  
	pass
	
	
func set_scene(scene): 
	sceneNode = scene; 
