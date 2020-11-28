extends Control

# This prevents clicking on the enemy

onready var levelText : Label = $BG/UI/PlayerInfo/AvatarButton/LevelBG/LevelText
onready var healthBar : TextureProgress = $BG/UI/PlayerInfo/StatusBars/HealthBar
onready var xpBar : TextureProgress = $BG/UI/PlayerInfo/XpBar;
onready var luxText : Label = $BG/LuxLabel; 
onready var stabilityBar : TextureProgress = $BG/UI/PlayerInfo/StatusBars/StabilityBar;

onready var profileUI : Control = $Profile; 


func _ready():
	Player.set_ui(self)
	
func update_level_text(level):
	levelText.text = str(level);

func update_health_bar(curHp, maxHp):
	healthBar.value = (100/maxHp) * curHp;
	
func update_xp_bar(curXp, xpToNextLevel):
	xpBar.value = (100/xpToNextLevel) * curXp;
	pass
	
func update_lux_text(lux):
	pass
	luxText.text = "Lux: " + str(lux);

func update_stability_bar(curStability, maxStability): 
	stabilityBar.value = (100/maxStability) * curStability;
	
func update_profile_text(mainGene: Gene, recGene: Gene): 
	print("SEaaaT"); 
	profileUI.set_main_genes_label(mainGene); 
	pass

func _on_HomeButton_pressed():
	Player.go_home(); 

func _on_SaveButton_pressed():
	GameData.save_game(); 
	print("SAVE"); 

func _on_AvatarButton_pressed():
	profileUI.set_main_genes_label(Player.playerNode.mainGenes); 
	profileUI.set_rec_genes_label(Player.playerNode.recGenes); 
	profileUI.visible = true; 
