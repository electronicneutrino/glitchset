class_name Creature extends KinematicBody2D

var isActivePlayer : bool;
var isMoving : bool = false;  
var facingDir = Vector2();
var vel = Vector2();
var moveTimer : Timer = Timer.new(); 

var selected : bool = false; 
 

onready var rayCast = $RayCast2D;
onready var anim = $AnimatedSprite;
onready var eye = $Eye; 

#properties
var creatureName : String; 
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


var spritesPath;
var mainGenes : Gene; 
var recGenes : Gene; 
var veryLikedFlavours : Array; 
var likedFlavours : Array;
var neutralFlavours : Array;  
var dislikedFlavours : Array; 
var veryDisikedFlavours : Array; 
var veryLikedTextures : Array; 
var likedTextures : Array;
var neutralTextures : Array;  
var dislikedTextures : Array; 
var veryDisikedTextures : Array; 

func _init():
	mainGenes = Gene.new(); 
	recGenes = Gene.new(); 

func set_phenotype(geneSet1: Gene, geneSet2 : Gene): 
	var eyeGenes = Gene.get_phenotype (geneSet1.eye, geneSet2.eye, Consts.eyesRarity);
	var tailGenes = Gene.get_phenotype (geneSet1.tail, geneSet2.tail, Consts.tailRarity);
	var patternGenes = Gene.get_phenotype (geneSet1.pattern, geneSet2.pattern, Consts.patternRarity);
	var featureGenes = Gene.get_phenotype (geneSet1.feature, geneSet2.feature, Consts.featuresRarity);
	var coldGenes = Gene.get_phenotype (geneSet1.coldProof, geneSet2.coldProof);
	var heatGenes = Gene.get_phenotype (geneSet1.heatProof, geneSet2.heatProof);
	var dryGenes = Gene.get_phenotype (geneSet1.dryProof, geneSet2.dryProof);
	var wetGenes = Gene.get_phenotype (geneSet1.wetProof, geneSet2.wetProof);
	mainGenes.eye = eyeGenes[0]; 
	recGenes.eye = eyeGenes[1]; 
	mainGenes.tail = tailGenes[0];
	recGenes.tail = tailGenes[1]; 
	mainGenes.pattern = patternGenes[0];
	recGenes.pattern = patternGenes[1]; 
	mainGenes.feature = featureGenes[0];
	recGenes.feature = featureGenes[1]; 
	mainGenes.coldProof = coldGenes[0];
	recGenes.coldProof = coldGenes[1]; 
	mainGenes.heatProof = heatGenes[0];
	recGenes.heatProof = heatGenes[1]; 
	mainGenes.dryProof = dryGenes[0];
	recGenes.dryProof = dryGenes[1]; 
	mainGenes.wetProof = wetGenes[0];
	recGenes.wetProof = wetGenes[1]; 
	
	
func randomize_basic():
	mainGenes.randomize_basic(); 
	recGenes.randomize_basic();
	set_sprite(); 
	
func randomize_all():
	mainGenes.randomize_all(); 
	recGenes.randomize_all();
	set_sprite(); 
	
func apply_genes(type, num): 
	randomize(); 
	var applyRec = randf(); 
	mainGenes.apply(type, num); 
	if applyRec < 0.8: 
		recGenes.apply(type, num); 
	set_sprite(); 


func _ready():
	set_sprite(); 
	
	if isActivePlayer: 
		Player.cameraNode.set_target(self); 
		Player.set_active(self); 

func set_as_active():
	if Player.playerNode:
		# stop player if player is moving-- this is solved by wandering behvaviour though
		Player.playerNode.isActivePlayer = false; 
	isActivePlayer = true; 
	Player.set_active(self); 
	modulate = Color.white; 
	selected = false; 

func set_sprite():
	set_eyes(mainGenes.eye); 
	set_tail(mainGenes.tail); 
	set_pattern(mainGenes.pattern); 
	set_feature(mainGenes.feature); 

func _process(delta):
	if $Base.is_pixel_opaque(get_local_mouse_position()):
		if not isActivePlayer:
			modulate = Color.lightgreen; 
			selected = true; 
	else: 
		selected = false; 
		modulate = Color.white; 
	
func _input(event):
	if selected: 
		var clickEvent = event is InputEventMouseButton; 
		if clickEvent and event.button_index == BUTTON_LEFT:
			if not isActivePlayer:
				set_as_active(); 
			else: 
				# display menu
				# home button? 	
				pass;  

func _physics_process(delta):
	if isActivePlayer:
		vel = Vector2();
		if Input.is_action_pressed(("move_up")):
			vel.y -=1;
			facingDir = Vector2(0, -1);
		if Input.is_action_pressed(("move_down")):
			vel.y +=1;
			facingDir = Vector2(0, 1);
		if Input.is_action_pressed(("move_left")):
			vel.x -=1;
			facingDir = Vector2(-1, 0);
		if Input.is_action_pressed(("move_right")):
			vel.x +=1;
			facingDir = Vector2(1, 0);
		if Input.is_action_just_pressed("interact"):
			try_interact();
#	else: 
#		if not isMoving:
#			randomize(); 
#			vel.x = (randi()%3)-1; 
#			print("velcoties of")
#			print(vel.x); 
#			randomize(); 
#			vel.y = (randi()%3)-1; 
#			print(vel.y)
#			move_for_time(vel); 
	move_and_slide(vel*Player.moveSpeed, Vector2.ZERO);
#	manage_animations();

func manage_animations():
	vel = vel.normalized();
	if vel.length()>0: 
		play_animation("default");
	else: 
		stop_animation();
		
func play_animation(anim_name):
	if anim.animation != anim_name: 
		anim.play(anim_name);
	
func stop_animation():
	anim.stop(); 
	
	
func colorForTime(color, waitTime):
	modulate = color;
	var t = Timer.new();
	t.set_wait_time(waitTime);
	t.set_one_shot(true);
	self.add_child(t);
	t.start();
	yield(t, "timeout");
	t.queue_free()
	modulate = Color.white; 
	

func move_for_time(dir):
	randomize(); 
	var waitTime = randi()%3+2; 
	print("WAIT TIME OF " + str(waitTime))
	isMoving = true; 
	if waitTime > 0:
		var t = Timer.new();
		t.set_wait_time(waitTime);
		t.set_one_shot(true);
		self.add_child(t);
		t.start();
		yield(t, "timeout");
		isMoving = false; 
		t.queue_free()
	
func try_interact():
	rayCast.cast_to = facingDir * Player.interactDist;
	
	if rayCast.is_colliding():
		if rayCast.get_collider() is KinematicBody2D:
			rayCast.get_collider().take_damage(Player.damage);
		elif rayCast.get_collider().has_method("on_interact"):
			rayCast.get_collider().on_interact(self);

func set_eyes(type):
	$Eye.set_type(type); 
	
func set_tail(type):
	$Tail.set_type(type); 
	
func set_pattern(type):
	$Pattern.set_type(type); 

func set_feature(type): 
	$Feature.set_type(type); 

func save():
	pass
