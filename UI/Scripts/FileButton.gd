extends MenuButton

onready var menu = get_popup()
onready var menu_buttons = ["New", "Open", "Save As", "Save", "Quit"]

func _ready():
	for i in menu_buttons:
		menu.add_item(i, menu_buttons.find(i))
		
	menu.connect("id_pressed", self, "_on_file_select")

func _on_file_select(ID):
	match ID:
		0:
			pass
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			get_tree().quit()
