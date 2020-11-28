extends Control

onready var mainSpecies : Label = $Background/Info/Main/Species; 
onready var mainPattern : Label = $Background/Info/Main/Pattern; 
onready var mainFeature : Label = $Background/Info/Main/Feature;
onready var mainEye : Label = $Background/Info/Main/Eye; 
onready var mainTail : Label = $Background/Info/Main/Tail;

onready var recSpecies : Label = $Background/Info/Rec/Species;
onready var recPattern : Label = $Background/Info/Rec/Pattern; 
onready var recFeature : Label = $Background/Info/Rec/Feature; 
onready var recEye : Label = $Background/Info/Rec/Eye; 
onready var recTail : Label = $Background/Info/Rec/Tail; 

func set_main_genes_label(geneSet : Gene): 
#	set_main_species_label(geneSet.species); 
	set_main_pattern_label(geneSet.pattern); 
	set_main_feature_label(geneSet.feature); 
	set_main_eye_label(geneSet.eye); 
	set_main_tail_label(geneSet.tail); 
	pass

func set_rec_genes_label(geneSet : Gene): 
#	set_rec_species_label(geneSet.species); 
	set_rec_pattern_label(geneSet.pattern); 
	set_rec_feature_label(geneSet.feature); 
	set_rec_eye_label(geneSet.eye); 
	set_rec_tail_label(geneSet.tail); 

# MAIN GENES LABELS	
func set_main_species_label(species : int):
	var name = Consts.speciesString[species]; 
	mainSpecies.text = "Species: " + name;  
	
func set_main_pattern_label(pattern : int):
	var name = Consts.patternString[pattern] 
	mainPattern.text = "Pattern: " + name;  

func set_main_feature_label(feature : int):
	var name = Consts.featuresString[feature]; 
	mainFeature.text = "Feature: " + name;  
	
func set_main_eye_label(eye : int):
	var name = Consts.eyesString[eye]; 
	mainEye.text = "Eyes: " + name;  

func set_main_tail_label(tail : int):
	var name = Consts.tailString[tail]; 
	mainTail.text = "Tail: " + name;  

# REC GENES LABELS	
func set_rec_species_label(species : int):
	var name = Consts.speciesString[species]; 
	recSpecies.text = "Species: " + name;  
	
func set_rec_pattern_label(pattern : int):
	var name = Consts.patternString[pattern];
	recPattern.text = "Pattern: " + name;  

func set_rec_feature_label(feature : int):
	var name = Consts.featuresString[feature]; 
	recFeature.text = "Feature: " + name;  
	
func set_rec_eye_label(eye : int):
	var name = Consts.eyesString[eye];  
	recEye.text = "Eye: " + name;  

func set_rec_tail_label(tail : int):
	var name = Consts.tailString[tail]; 
	recTail.text = "Tail: " + name;  

func _on_Close_pressed():
	visible = false; 
