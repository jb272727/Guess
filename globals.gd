extends Node

@export var data : Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func purge() -> void:
	data = {}

func find_card(cardBody: StaticBody3D):      # -> int | Dictionary
	if !Globals.data.has(cardBody):
		return -1
	
	return Globals.data[cardBody]
