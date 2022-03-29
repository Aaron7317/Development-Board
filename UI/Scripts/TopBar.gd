extends CanvasLayer

signal mouse_enter_ui
signal mouse_exit_ui

func _ready():
	for i in get_node("HBoxContainer").get_children():
		i.connect("mouse_entered", self, "send_mouse_enter_signal")
		i.connect("mouse_exited", self, "send_mouse_exit_signal")
		i.get_popup().connect("mouse_entered", self, "send_mouse_enter_signal")
		i.get_popup().connect("hide", self, "send_mouse_exit_signal")

func send_mouse_enter_signal():
	emit_signal("mouse_enter_ui")

func send_mouse_exit_signal():
	emit_signal("mouse_exit_ui")

func _on_HBoxContainer_mouse_entered():
	send_mouse_enter_signal()

func _on_HBoxContainer_mouse_exited():
	send_mouse_exit_signal()
