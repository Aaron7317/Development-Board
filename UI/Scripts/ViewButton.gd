extends MenuButton

onready var menu = get_popup()
onready var menu_buttons = {
	"Toggle Fullscreen": 0
}

func _ready():
	for key in menu_buttons:
		menu.add_item(key, menu_buttons[key])
		
	menu.connect("id_pressed", self, "_on_view_select")
	
func _on_view_select(ID):
	match ID:
		0:
			_toggle_fullscreen()
			
func _toggle_fullscreen():
	OS.window_fullscreen = !OS.window_fullscreen
