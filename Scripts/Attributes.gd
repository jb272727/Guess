extends Node3D
class_name Attributes

@export var hair_type : CharacterFeatures.Hair

# Called when the node enters the scene tree for the first time.
func _ready():
	var hair_size = CharacterFeatures.Hair.size()
	print(hair_size)
	print(hair_type)


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
