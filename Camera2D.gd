extends Camera2D

export var camera_speed = 10
var is_panning

func _ready():
	current = true

func _process(_delta):
	is_panning = Input.is_action_pressed("mb_middle")

func _unhandled_input(event):
	if (event is InputEventMouseButton && event.is_pressed()):
		if (event.button_index == BUTTON_WHEEL_UP):
			zoom -= Vector2(0.1, 0.1)
		if (event.button_index == BUTTON_WHEEL_DOWN):
			zoom += Vector2(0.1, 0.1)
	if (event is InputEventMouseMotion && is_panning):
		offset -= event.relative * zoom
