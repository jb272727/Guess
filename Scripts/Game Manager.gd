extends Node3D

var hair = ["Bald", "Brown hair", "Blonde hair", "Red hair", "Blue hair", "Black hair", "Gray hair"]
var hat = ["", "Top hat", "Fedora", "Baseball cap", "Brimless hat", "Horns", "Witch hat"]
var eyes = ["No eyes", "Closed eyes", "Sad eyes", "Happy eyes"]
var ears = ["No ears", "Big ears", "Small ears", "Giant ears"]
var nose = ["No nose", "Big nose", "Small nose", "Giant nose"]
var mouth = ["Silent", "Big mouth", "Small mouth", "Indifferent", "Smiling", "Frowning"]
var chin = ["No chin", "Double chin", "Pointy chin"]
var skin_color = ["No skin", "Red skin", "Orange skin", "Yellow skin", "Green skin", "Blue skin", "Purple skin", "Brown skin", "Black skin", "White skin", "Gray skin"]
var shirt_color = ["No shirt", "Red shirt", "Blue shirt", "Green shirt", "Black shirt", "White shirt", "Gray shirt", "Yellow shirt"]
var facial_hair = ["", "Mustache", "Beard", "Goatee", "Sideburns"]
var misc = ["", "Monocle", "Mole", "Scar", "Glasses"]

@onready var camera = %Camera
@export var current_object : StaticBody3D = null
@export var selected_object : StaticBody3D = null

var ui_instance : Control
var ui_active : bool = false
const ui = preload("res://Scenes/card_select.tscn")
const ui_option = preload("res://Scenes/ui_option.tscn")

var mousePos

signal ui_select(cardId: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	ui_instance = ui.instantiate()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	# Process inputs
	if Input.is_action_just_pressed("lmb"):
		selected_object = current_object
		print(selected_object)

	elif Input.is_action_just_pressed("rmb"):
		# emit event to UI to open menu if card is valid
		var cardId = Globals.find_card(current_object)
		if typeof(cardId) == TYPE_INT: return
		
		selected_object = current_object
		emit_signal("ui_select", selected_object)



	# Find current object aimed at
	mousePos = get_viewport().get_mouse_position()
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
	print(Globals.data[selected_object])
	ui_active = true
	ui_instance.set_position(mousePos)
	var VBox : VBoxContainer = ui_instance.get_node("VBoxContainer")
	var index_where_features_start_offset : int = 1
	# var keys : Array[String] = Globals.data[selected_object].keys()
	var values = Globals.data[selected_object].values()
	for i in range(index_where_features_start_offset, CharacterFeatures.FeatureType.size()):
		var strings : Array[String] = get_feature_string(i - index_where_features_start_offset, values[i]) # i is the feature type, 
		for string in strings:
			var ui_option_instance = ui_option.instantiate()
			ui_option_instance.initialize(i, values[i], string)
			VBox.add_child(ui_option_instance) 
	add_child(ui_instance)

# returns an array of the strings belonging to that feature. Indifferent small mouth should return as ["Indifferent", "Small mouth"]
# need to check if this ever returns a "" b/c then we should do nothing
func get_feature_string(type : CharacterFeatures.FeatureType, idx: int) -> Array[String]:
	match type:
		CharacterFeatures.FeatureType.HAIR:
			return [hair[idx]]
		CharacterFeatures.FeatureType.HAT:
			return [hat[idx]]
		CharacterFeatures.FeatureType.EYES:
			return [eyes[idx]]
		CharacterFeatures.FeatureType.EARS:
			return [ears[idx]]
		CharacterFeatures.FeatureType.NOSE:
			return [nose[idx]]
		CharacterFeatures.FeatureType.MOUTH:
			match idx:
				# big mouth (mouth[1])
				1:
					return [mouth[1], mouth[4]]
				3:
					return [mouth[1], mouth[3]]
				5:
					return [mouth[1], mouth[5]]
				# small mouth (mouth[2])
				2:
					return [mouth[2], mouth[4]]
				4:
					return [mouth[2], mouth[3]]
				6:
					return [mouth[2], mouth[5]]
			return [mouth[idx]]
		CharacterFeatures.FeatureType.CHIN:
			return [chin[idx]]
		CharacterFeatures.FeatureType.SKIN_COLOR:
			return [skin_color[idx]]
		CharacterFeatures.FeatureType.SHIRT_COLOR:
			return [shirt_color[idx]]
		CharacterFeatures.FeatureType.FACIAL_HAIR:
			return [facial_hair[idx]]
		CharacterFeatures.FeatureType.MISC:
			return [misc[idx]]
	return [""]
