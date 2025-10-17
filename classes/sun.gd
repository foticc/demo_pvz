extends Area2D

@export var target:Vector2 = Vector2.ZERO

func _ready() -> void:
	pass

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		collect()

func _target_position()->Vector2:
	return Vector2(442,73)

func collect()->void:
	var tween = create_tween()
	tween.tween_property(self,"global_position",target,0.3)
	
	await tween.finished
	
	queue_free()
