extends Node3D
class_name Apparatus

const CardScene = preload("res://Scenes/card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	# example of initting in the scene:
	var card := CardScene.instantiate()
	
	var attr = card.get_node("Attributes") as Attributes
	attr.hair_type = CharacterFeatures.Hair.BROWN
	
	add_child(card)
# attr_node.hair_color = Color.html("86c5ff")
# add_child(attr_node)  # now _ready() will see your values


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
