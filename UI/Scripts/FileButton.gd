extends MenuButton

onready var menu = get_popup()
onready var menu_buttons = {
	"New": 0,
	"Open": 1,
	"Save As": 2,
	"Save": 3,
	"Quit": 4
}

func _ready():
	for key in menu_buttons:
		menu.add_item(key, menu_buttons[key])
		
	menu.connect("id_pressed", self, "_on_file_select")

func _on_file_select(ID):
	match ID:
		0:
			_new()
		1:
			_open()
		2:
			_save_as()
		3:
			_save()
		4:
			_quit()

func _new():
	pass
	
func _open():
	pass
	
func _save_as():
	pass
	
func _save():
	pass
	
func _quit():
	get_tree().quit()
