extends Node3D

@onready var camera = %Camera
@export var current_object : StaticBody3D = null
@export var selected_object : StaticBody3D = null

const ui = preload("res://Scenes/card_select.tscn")
const ui_option = preload("res://Scenes/ui_option.tscn")

signal ui_select(cardId: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	# Process inputs
	if Input.is_action_just_pressed("lmb"):
		selected_object = current_object
		print(selected_object)
	elif Input.is_action_just_pressed("rmb"):
		# emit event to UI to open menu if card is valid
		var cardId = Globals.find_card(selected_object)
		if cardId == -1: return
		
		selected_object = current_object
		emit_signal("ui_select", selected_object)



	# Find current object aimed at
	var mousePos = get_viewport().get_mouse_position()
	var rayLength = 100
	var from = camera.project_ray_origin(mousePos)
	var to = from + camera.project_ray_normal(mousePos) * rayLength
	var space = get_world_3d().direct_space_state
	var rayQuery = PhysicsRayQueryParameters3D.new()
	rayQuery.from = from
	rayQuery.to = to
	rayQuery.collide_with_areas = true
	rayQuery.collide_with_bodies = true  # Make sure to also collide with bodies if needed

	var result = space.intersect_ray(rayQuery)
	if result:
		if result.collider is StaticBody3D:
			current_object = result.collider
	else:
		current_object = null



func _on_ui_select(selected_object):
	# @TODO check to ensure rmb menu is not already open
	var ui_instance := ui.instantiate()
	ui_instance.add_child(ui_option.instantiate()) # @TODO: can add args to construct the ui option scene with?
	add_child(ui_instance)
