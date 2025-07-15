extends Node3D
class_name Attributes

@export var hair: CharacterFeatures.Hair = CharacterFeatures.Hair.NO_HAIR
@export var hat: CharacterFeatures.Hat = CharacterFeatures.Hat.NO_HAT
@export var eyes: CharacterFeatures.Eyes = CharacterFeatures.Eyes.NO_EYES
@export var ears: CharacterFeatures.Ears = CharacterFeatures.Ears.NO_EARS
@export var nose: CharacterFeatures.Nose = CharacterFeatures.Nose.NO_NOSE
@export var mouth: CharacterFeatures.Mouth = CharacterFeatures.Mouth.NO_MOUTH
@export var chin: CharacterFeatures.Chin = CharacterFeatures.Chin.NO_CHIN
@export var skin_color: CharacterFeatures.SkinColor = CharacterFeatures.SkinColor.NONE
@export var shirt_color: CharacterFeatures.ShirtColor = CharacterFeatures.ShirtColor.SHIRT_NONE
@export var facial_hair: CharacterFeatures.FacialHair = CharacterFeatures.FacialHair.NO_FACIAL_HAIR
@export var misc: CharacterFeatures.Misc = CharacterFeatures.Misc.NONE

# Called when the node enters the scene tree for the first time.
func _ready():
	var hair_size = CharacterFeatures.Hair.size()
	print(hair_size)
	print(hair)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# example of initting in the scene:
# var attr_scene := preload("res://Attribute.tscn")
# var attr_node := attr_scene.instantiate() as Attribute
## set your custom values *before* adding to the tree:
# attr_node.ear_type = "big"
# attr_node.hair_color = Color.html("86c5ff")
# add_child(attr_node)  # now _ready() will see your values
