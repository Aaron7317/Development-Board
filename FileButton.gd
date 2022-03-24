extends MenuButton


func _ready():
	print("ready")
	get_popup().connect("id_pressed", self, "_on_file_select")
	

func _on_file_select(ID):
	print(ID)
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
			print("exit?")
			get_tree().quit()

func _new():
	pass
	
func _save_as():
	pass
	
func _save():
	pass
