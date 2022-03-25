extends HBoxContainer

onready var selected_object = get_node("/root/Main/SelectedObject")

func _ready():
	connect("mouse_entered", self, "_on_HBoxContainer_mouse_entered")
	connect("mouse_exited", self, "_on_HBoxContainer_mouse_exited")
	pass

func _on_HBoxContainer_mouse_entered():
	selected_object.is_placeable = false
	selected_object.hide()
	pass # Replace with function body.


func _on_HBoxContainer_mouse_exited():
	selected_object.is_placeable = true
	selected_object.show()
	pass # Replace with function body.
