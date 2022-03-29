extends MenuButton

signal insert_item(item_type)

onready var menu = get_popup()
onready var menu_buttons = ["Image"]

func _ready():
	for i in menu_buttons:
		menu.add_item(i, menu_buttons.find(i))
		
	menu.connect("id_pressed", self, "_on_insert_select")
	
func _on_insert_select(ID):
	emit_signal("insert_item", ID)
