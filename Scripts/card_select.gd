extends Control

var mouse_in : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# just do constant tracking of mouse in or out manually self.get_local_mouse_position() ?
	if Input.is_action_just_pressed("lmb"):
		print("mouse in: ", mouse_in)
		if mouse_in: return
		free_children()
	pass

func free_children() -> void:
	for child in self.get_child(0).get_children():
		child.queue_free()


func _on_TextureButton_pressed(button: TextureButton) -> void:
	print("received signal pressed")
	button.queue_free()


func _on_mouse_entered():
	mouse_in = true

func _on_mouse_exited():
	mouse_in = false



#func free_siblings() -> void:
	#var parent = self.get_parent()
	#for child in parent.get_children():
		#if child != self:
			#child.queue_free()
