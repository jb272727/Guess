extends TextureButton

@export var control_parent : Control


# Called when the node enters the scene tree for the first time.
func _ready():
	control_parent = self.get_parent().get_parent()
	var cb = Callable(control_parent, "_on_TextureButton_pressed")
	connect("pressed", cb)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
