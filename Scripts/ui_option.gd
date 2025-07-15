extends TextureButton

@export var control_parent : Control
#@export var game_manager : Node3D
var mouse_in : bool


# Called when the node enters the scene tree for the first time.
func _ready():
	#game_manager = get_node("%Game Manager") as Node3D
	control_parent = self.get_parent().get_parent()
	
	var cb = Callable(control_parent, "_on_TextureButton_pressed")
	cb = cb.bind(self)
	connect("pressed", cb)


# Called every frame. 'delta' is the elapsed time since the previous frame.



#func _notification(what: int) -> void:
	#if what == NOTIFICATION_PREDELETE:
		#_on_destroy()
		#
#func _on_destroy() -> void:
	#emit_signal("_on_TextureButton_pressed")
	#print("TextureButton was just freed!")

