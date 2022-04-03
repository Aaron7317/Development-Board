extends Node

onready var insert = get_node("TopBar/HBoxContainer/InsertButton")
onready var object_inserter = get_node("ObjectInserter")
onready var object_selector = get_node("ObjectInserter")

onready var camera = get_node("Camera2D")
export var camera_speed = 10

onready var mode = object_mode.NONE
enum object_mode {
	NONE,
	INSERT,
	SELECT
}

func _ready():
	camera.current = true
	insert.connect("insert_item", self, "_set_inserter_object")

func _unhandled_input(event):
	if (event is InputEventMouseButton && event.is_pressed()):
		if (event.button_index == BUTTON_WHEEL_UP):
			camera.zoom -= Vector2(0.1, 0.1)
		if (event.button_index == BUTTON_WHEEL_DOWN):
			camera.zoom += Vector2(0.1, 0.1)
	if (event is InputEventMouseMotion && Input.is_action_pressed("mb_middle")):
		camera.global_position -= event.relative * camera.zoom

func _set_inserter_object(ID):
	mode = object_mode.INSERT
	var image = preload("res://Objects/Scenes/Image.tscn")
	object_inserter.current_selected_object = image
	object_inserter.get_node("Sprite").texture = image.instance().get_node("Preview").texture

func _on_ObjectInserter_place_object(position):
	if (mode == object_mode.INSERT):
		var new_object = object_inserter.current_selected_object.instance()
		add_child(new_object)
		new_object.is_placed = true
		new_object.global_position = position
		new_object.connect("selected", self, "_set_selector_object")
		_reset_mode()

func _set_selector_object(entity):
	if (mode == object_mode.NONE):
		print("selecting")
		object_selector.current_selected_object = entity
		object_selector.get_node("Sprite").texture = entity.get_node("Preview").texture

func _reset_mode():
	mode = object_mode.NONE
	
	object_inserter.current_selected_object = null
	object_inserter.get_node("Sprite").texture = null
	
	object_selector.current_selected_object = null
	object_selector.get_node("Sprite").texture = null

func _on_TopBar_mouse_enter_ui():
	object_inserter.is_placeable = false
	object_inserter.hide()


func _on_TopBar_mouse_exit_ui():
	object_inserter.is_placeable = true
	object_inserter.show()
