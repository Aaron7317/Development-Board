extends Node2D

var is_placeable = true
onready var board = get_node("/root/Main/Board")

var current_selected_object

func _ready():
	pass

func _process(_delta):
	global_position = get_global_mouse_position()
	if (current_selected_object != null and is_placeable and Input.is_action_just_pressed("mb_left")):
		var new_object = current_selected_object.instance()
		board.add_child(new_object)
		new_object.global_position = get_global_mouse_position()
