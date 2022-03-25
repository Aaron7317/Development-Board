extends MenuButton

onready var menu = get_popup()
onready var menu_buttons = {
	"Image": 0
}

# temporary
var image = preload("res://Objects/Scenes/Image.tscn")
var test_image_instance = image.instance()

onready var selected_object = get_node("/root/Main/SelectedObject")
onready var selected_object_sprite = selected_object.get_node("Sprite")

func _ready():
	add_child(test_image_instance)
	
	for key in menu_buttons:
		menu.add_item(key, menu_buttons[key])
		
	menu.connect("id_pressed", self, "_on_insert_select")
	
func _on_insert_select(ID):
	match ID:
		0:
			_set_image()

func _set_image():
	# set current_selected_object to 
	
	selected_object_sprite.texture = load(test_image_instance.image_path)
	selected_object.current_selected_object = test_image_instance
	
			
