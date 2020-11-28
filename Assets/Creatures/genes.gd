class_name Gene extends Reference

var species;
var primaryColor; 
var secondaryColor;
var teriaryColor;
var pattern;
var feature; 
var eye = Enums.Eyes.BORED;
var tail; 
var coldProof : bool; 
var heatProof : bool; 
var dryProof : bool; 
var wetProof : bool; 

const mutationChance = 0.05; 
const flipChance = 0.05; 


func randomize_basic():
	var patternType = Utils.get_with_rarity(Consts.patternRarity); 
	var eyeType = Utils.get_with_rarity(Consts.eyesRarity); 
	var tailType = Utils.get_with_rarity(Consts.tailRarity); 
	var featureType = Utils.get_with_rarity(Consts.featuresRarity);
	apply(Enums.Genes.PATTERN, patternType); 
	apply(Enums.Genes.EYE, eyeType);
	apply(Enums.Genes.TAIL, tailType);
	apply(Enums.Genes.FEATURE, featureType);
#	var speciesType = Utils.get_with_rarity(eyesRarity); 	
	
func apply(type, num):
	if type == Enums.Genes.SPECIES:
		species = num; 
	elif type == Enums.Genes.EYE:
		eye = num;
	elif type == Enums.Genes.PATTERN: 
		pattern = num; 
	elif type == Enums.Genes.FEATURE: 
		feature = num; 
	elif type == Enums.Genes.TAIL: 
		tail = num; 
	elif type == Enums.Genes.HEAT_PROOF: 
		heatProof = num;  
	elif type == Enums.Genes.COLD_PROOF: 
		coldProof = num; 
	elif type == Enums.Genes.DRY_PROOF: 
		dryProof = num; 
	elif type == Enums.Genes.WET_PROOF: 
		wetProof = num; 
	pass

# both parents have equal chance? I'm thinking
# gets one gene from each parent
# if one's rarer than the other, rarer becomes rec 
# and other becomes dominant
# with a 5% chance of flip
# passing down is 50/50 on dominant or recessive 
# EXCEPT when one's rarer than nother. Then its 55/45 and 60/40
# small chance of mutation throw in, 5%? 
# otherwise it's 50/50 chance which one dominant 
# basically save a pair? 

static func get_passed_gene(gene1: int, gene2: int, ref: Dictionary = {}) -> int: 
	var chanceDif=0; 
	var randFloat1 = Utils.get_random_float();
	if not ref.empty():
		var randFloat2 = Utils.get_random_float();
		if randFloat2 < mutationChance: 
			return Utils.get_with_rarity(ref); 
		chanceDif = ref[gene1]-ref[gene1]; 
	if randFloat1 < 0.5+chanceDif/10: 
		return gene1; 
	else: 
		return gene2; 

static func get_phenotype(gene1: int, gene2: int, rarity: Dictionary  = {}) -> Array:
	var returnArray = [gene1, gene2]; 
	var chanceDif = 0; 
	var finalEye; 
	if not rarity.empty():
		chanceDif = rarity[gene1] - rarity[gene2]; 
	if chanceDif==0:
		var ranNum = Utils.get_random_float();
		if ranNum < 0.5: 
			return [gene1, gene2]; 
		else: 
			return [gene2, gene1];
	elif chanceDif<0:
		returnArray[0] = gene2;
		returnArray[1] = gene1; 
		
	var flipNum = Utils.get_random_float();
	if flipNum < flipChance: 
		var temp = returnArray[0];
		returnArray[0] = returnArray[1]; 
		returnArray[1] = temp; 
	return returnArray; 

func meiosis(Gene1 : Gene, Gene2: Gene): 
	eye = get_passed_gene(Gene1.eye, Gene2.eye, Consts.eyesRarity);
	pattern = get_passed_gene(Gene1.pattern, Gene2.pattern, Consts.patternRarity); 
	tail = get_passed_gene(Gene1.tail, Gene2.tail, Consts.tailRarity); 
	feature = get_passed_gene(Gene1.feature, Gene2.feature, Consts.featuresRarity); 
	coldProof = get_passed_gene(Gene1.coldProof, Gene2.coldProof); 
	heatProof = get_passed_gene(Gene1.heatProof, Gene2.heatProof); 
	dryProof = get_passed_gene(Gene1.dryProof, Gene2.dryProof); 
	wetProof = get_passed_gene(Gene1.wetProof, Gene2.wetProof); 

func copy(original : Gene): 
	eye = original.eye; 
	pattern = original.pattern; 
	tail = original.tail; 
	feature = original.feature; 
	coldProof = original.coldProof; 
	heatProof = original.heatProof; 
	dryProof = original.dryProof; 
	wetProof = original.dryProof; 

func save(): 
	pass
