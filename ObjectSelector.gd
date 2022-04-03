extends Node2D

var is_placeable
var current_selected_object

func _ready():
	pass

func _process(_delta):
	global_position = get_global_mouse_position()
	if (current_selected_object != null):
		current_selected_object.global_position = get_global_mouse_position()
