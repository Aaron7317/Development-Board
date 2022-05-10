
extends Node2D

export var color : Color = Color("#0000ff") setget set_color
var _rect : Rect2
export var is_visible : bool = true setget set_visible
var anchors : Array
var dragged_anchor : Dictionary = {}
var dragged_start_rect : Rect2

enum Anchors { TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_RIGHT }

const HANDLE_RADIUS : float = 6.0
const STROKE_RADIUS : float = 2.0
const STROKE_COLOR = Color("#0000ff")
const FILL_COLOR = Color("#ffffff")

func _ready():
	pass

func _draw() -> void:
#	if is_visible:
#		print("returning")
#		return
	draw_rect(_rect, color, false)
	calculate_anchors()

func set_color(value : Color) -> void:
	color = value
	update()

func set_visible(value : bool) -> void:
	is_visible = value

func calculate_anchors() -> void:
	if not is_visible:
		return

	anchors = []
	var edit_anchors = {
		Anchors.TOP_LEFT: _rect.position,
		Anchors.TOP_RIGHT: Vector2(_rect.position.x + _rect.size.x, _rect.position.y),
		Anchors.BOTTOM_LEFT: Vector2(_rect.position.x, _rect.position.y + _rect.size.y),
		Anchors.BOTTOM_RIGHT: _rect.position + _rect.size
	}
	for anchor in edit_anchors.keys():
		var new_anchor = {
			'anchor': anchor,
			'position': edit_anchors[anchor],
			'rect': Rect2(edit_anchors[anchor] - Vector2(HANDLE_RADIUS, HANDLE_RADIUS), Vector2(HANDLE_RADIUS, HANDLE_RADIUS) * 2.0)
		}
		draw_anchor(new_anchor)
		anchors.append(new_anchor)

func draw_anchor(value : Dictionary) -> void:
	draw_circle(value['position'], HANDLE_RADIUS + STROKE_RADIUS, STROKE_COLOR)
	draw_circle(value['position'], HANDLE_RADIUS, FILL_COLOR)

func drag_to(pos: Vector2) -> void:
	if not dragged_anchor:
		return
	match dragged_anchor['anchor']:
		Anchors.TOP_LEFT:
			_rect.position = pos 
			_rect.size = dragged_start_rect.size + (dragged_start_rect.position - pos)
		Anchors.TOP_RIGHT:
			_rect.position = Vector2(dragged_start_rect.position.x, pos.y)
			_rect.size = Vector2(pos.x - dragged_start_rect.position.x, dragged_start_rect.size.y + (dragged_start_rect.position.y - pos.y))
		Anchors.BOTTOM_LEFT:
			_rect.position = Vector2(pos.x, dragged_start_rect.position.y)
			_rect.size = Vector2(dragged_start_rect.size.x + (dragged_start_rect.position.x - pos.x), pos.y - dragged_start_rect.position.y)
		Anchors.BOTTOM_RIGHT:
			_rect.size = pos - dragged_start_rect.position

func forward_input(event : InputEvent) -> bool:
	if not is_visible:
		return false

	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if not dragged_anchor and event.is_pressed():
			for anchor in anchors: 
				if not anchor['rect'].has_point(event.position):
					continue
				dragged_anchor = anchor

				return true
		elif dragged_anchor and not event.is_pressed():
			drag_to(event.position)

	return false
