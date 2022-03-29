extends MenuButton

onready var menu = get_popup()
onready var menu_buttons = ["Toggle Fullscreen"]


func _ready():
	for i in menu_buttons:
		menu.add_item(i, menu_buttons.find(i))
		
	menu.connect("id_pressed", self, "_on_view_select")
	
func _on_view_select(ID):
	match ID:
		0:
			OS.window_fullscreen = !OS.window_fullscreen
