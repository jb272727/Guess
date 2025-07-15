extends Node3D
class_name Apparatus

@export var num_cards : int = 3
const CardScene = preload("res://Scenes/card.tscn")
@onready var test_position_1 = $"Test Position 1"

# +6 x dir
# +1 y dir

# Called when the node enters the scene tree for the first time.
func _ready():
	# example of initting in the scene:
	for i in range(num_cards):
		var card := CardScene.instantiate()
		var cardBody : StaticBody3D = card.get_node("Card Static Body")
		
		var attr = card.get_node("Attributes") as Attributes
		attr.hair        = randi_range(0, CharacterFeatures.Hair.size() - 1)
		attr.hat         = randi_range(0, CharacterFeatures.Hat.size() - 1)
		attr.eyes        = randi_range(0, CharacterFeatures.Eyes.size() - 1)
		attr.ears        = randi_range(0, CharacterFeatures.Ears.size() - 1)
		attr.nose        = randi_range(0, CharacterFeatures.Nose.size() - 1)
		attr.mouth       = randi_range(0, CharacterFeatures.Mouth.size() - 1)
		attr.chin        = randi_range(0, CharacterFeatures.Chin.size() - 1)
		attr.skin_color  = randi_range(0, CharacterFeatures.SkinColor.size() - 1)
		attr.shirt_color = randi_range(0, CharacterFeatures.ShirtColor.size() - 1)
		attr.facial_hair = randi_range(0, CharacterFeatures.FacialHair.size() - 1)
		attr.misc        = randi_range(0, CharacterFeatures.Misc.size() - 1)


		Globals.data[cardBody] = {
			"Position": i,
			"Hair": attr.hair,
			"Hat": attr.hat,
			"Eyes": attr.eyes,
			"Ears": attr.ears ,
			"Nose": attr.nose   ,
			"Mouth": attr.mouth  ,
			"Chin": attr.chin,
			"SkinColor": attr.skin_color,
			"ShirtColor": attr.shirt_color,
			"FacialHair": attr.facial_hair,
			"Misc": attr.misc ,
		}

		var position_node : Node3D = self.get_node("Test Position " + str(i))
		position_node.add_child(card)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
