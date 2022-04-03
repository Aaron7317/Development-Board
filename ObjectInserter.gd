extends Node2D

var is_placeable = true
var current_selected_object

signal place_object(position)

func _ready():
	pass

func _process(_delta):
	global_position = get_global_mouse_position()
	if (current_selected_object != null and is_placeable and Input.is_action_just_pressed("mb_left")):
		emit_signal("place_object", get_global_mouse_position())
