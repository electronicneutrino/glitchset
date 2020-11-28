
class_name Enemy extends KinematicBody2D

var tile : Vector2; 
var level : int = 0; 
var nextHeight = 0; 

onready var enemyBlock = preload("res://Assets/Placeholder/enemyBlock.tscn")

func ready(): 
	add_enemy_layer(); 
	pass

func add_enemy_layer():
	if level<3: 
		var newBlock = enemyBlock.instance(); 
		newBlock.position.y-=nextHeight;
		nextHeight+=40; 
		add_child(newBlock); 
		newBlock.parentPosition=position; 
		newBlock.connect("blockDeath", self, "remove_layer")
		level+=1; 

func remove_layer(): 
	level-=1; 
	nextHeight-=30; 
	# make the ones above drop down
