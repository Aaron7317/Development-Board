extends Node

onready var insert = get_node("TopBar/HBoxContainer/InsertButton")
onready var object_selector = get_node("ObjectSelector")

func _ready():
	insert.connect("insert_item", self, "_set_selected_object")

func _set_selected_object(ID):
	var image = preload("res://Objects/Scenes/Image.tscn")
	object_selector.current_selected_object = image
	object_selector.get_node("Sprite").texture = image.instance().get_node("Preview").texture


func _on_ObjectSelector_place_object(position):
	var new_object = object_selector.current_selected_object.instance()
	add_child(new_object)
	new_object.global_position = position
	object_selector.current_selected_object = null
	object_selector.get_node("Sprite").texture = null


func _on_TopBar_mouse_enter_ui():
	object_selector.is_placeable = false
	object_selector.hide()


func _on_TopBar_mouse_exit_ui():
	object_selector.is_placeable = true
	object_selector.show()
