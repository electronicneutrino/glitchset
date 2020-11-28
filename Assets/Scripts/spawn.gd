extends TileMap

export (Dictionary) var hotSpots : Dictionary; # Vector2 and Vector2
# top left of hotspot + dimension of hotspot
var spawnList : Dictionary;  # Vector 2 and spawn instance
export (float) var tileSpawnChance: float = 0.3; 
export (float) var spotSpawnChance: float = 1; 
export (int) var minSpawnTime : int; 
export (int) var maxSpawnTime : int; 

var timer : Timer; 

func _ready():
	timer = Timer.new();
	add_child(timer);
	timer.start();
	timer.connect("timeout", self, "random_spawn_times")

var enemy = preload("res://Assets/Placeholder/Enemy.tscn"); 

func start(): 
	for n in range(0, 3):
		world_spawn();
func world_spawn():
	var randNum : float; 
	for hotSpot in hotSpots: 
		randNum = Utils.get_random_float(); 
		if randNum < spotSpawnChance: 
			hotspot_spawn(hotSpot); 

func hotspot_spawn(hotSpot : Vector2):
	var randNum : float; 
	var xCoord = hotSpot.x; 
	var yCoord = hotSpot.y;
	for n in range(0, hotSpots[hotSpot].x):
		for i in range(0, hotSpots[hotSpot].y):
			var enemyPos = Vector2(xCoord+n, yCoord+i); 
			if get_cell(enemyPos.x, enemyPos.y)!=INVALID_CELL: 
				randNum = Utils.get_random_float(); 
				if randNum < tileSpawnChance:  
					if spawnList.has(enemyPos): 
						spawnList[enemyPos].add_enemy_layer(); 
					else: 
						new_enemy_in_pos(enemy, enemyPos)

func new_enemy_in_pos(enemy, enemyPos : Vector2):
	spawnList[enemyPos] =  enemy.instance(); 
	Player.sceneNode.add_ysort_child(spawnList[enemyPos]); 
	var realPos = map_to_world(enemyPos); 
	realPos.y+=30; # to make it look centered
	spawnList[enemyPos].position = realPos;  
	spawnList[enemyPos].tile = enemyPos; 
	spawnList[enemyPos].connect("death", self, "remove_enemy")

func random_spawn_times(): 
	var randNum = Utils.get_random_int(minSpawnTime, maxSpawnTime); 
	timer.set_wait_time(randNum);
	world_spawn(); 


func remove_enemy(enemyPos):
	spawnList.erase(enemyPos); 
