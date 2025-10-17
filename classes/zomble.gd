extends Area2D

func _process(delta: float) -> void:
	position += Vector2(-delta * 100,0)
