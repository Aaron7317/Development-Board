extends Area2D

signal selected(selected_instance)

var is_placed = false

func _ready():
	pass

func _on_Entity_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed && event.button_index == BUTTON_RIGHT && is_placed):
		emit_signal("selected", self)
#event.button_index == BUTTON_LEFT
