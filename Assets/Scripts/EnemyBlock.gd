
extends KinematicBody2D

signal blockDeath; 

var curHp : int = 5;
export (int) var maxHp : int = 5;
var parentPosition : Vector2; 

var tile : Vector2; 
var level : int = 0; 
export (int) var xpToGive : int = 30;

export (int) var damage : int = 1;
export (float) var attackRate : float = 1.0;
var attackDist : int = 100; 

var selected : bool = false;

export (float) var dropRate: float = 0.5 ; 

export (Dictionary) var drops : Dictionary; 

var takingDamage : bool = false;
var damageTimeout : int = 5; 

onready var timer = $Timer; 
onready var target = Player.playerNode;


func _ready():
	timer.wait_time = attackRate; 
	timer.start();  
	
	
# warning-ignore:unused_argument
func _process(delta):
	if selected: 
		if not Player.in_range(parentPosition):
			modulate = Color.white;
			selected = false;

# warning-ignore:unused_argument
func _physics_process(delta):
	pass 
	
func _on_Timer_timeout():
	# if not taking damage attack player
	if not takingDamage: 
		if Player.in_range(parentPosition): 
			Player.take_damage(damage);

func take_damage (dmgToTake):
	takingDamage = true; 
	curHp -=dmgToTake; 
	if curHp<0:
		die();
	var t = Timer.new();
	t.set_wait_time(damageTimeout);
	t.set_one_shot(true);
	self.add_child(t);
	t.start();
	yield(t, "timeout");
	t.queue_free()
	takingDamage = false; 
	
func die():
	# multiplier happens here
	emit_signal("blockDeath"); 
	Player.give_xp(xpToGive);
	Player.give_lux(xpToGive)
	drop_items(); 
	queue_free();

func drop_items(): 
	randomize();
	var doDrop = randf(); 
	if doDrop<dropRate:
		Player.handle_drops(drops); 
	
func _on_Enemy_mouse_entered():
	if Player.in_range(parentPosition): 
		selected = true;
		modulate = Color.blueviolet;

func _on_Enemy_mouse_exited():
	modulate = Color.white;
	selected = false;

func _on_Enemy_input_event(viewport, event, shape_idx):
	if selected:
		if event.is_pressed()	: 
			take_damage(Player.get_damage());
			Player.is_interacting(Enums.Actions.ATTACK);
	# might want to set input as handled so we don't get two at once
	# but also it would be nice to select the top one only
		

