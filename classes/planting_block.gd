extends Area2D
class_name PlantingBlock

var current_pos:Vector2

func _ready() -> void:
	self.current_pos = position


func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		get_tree().call_group("game","plant",current_pos)
