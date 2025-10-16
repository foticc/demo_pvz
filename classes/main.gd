extends Node2D

@onready var camera: Camera2D = $Camera2D

func _ready() -> void:
	var start_pos = camera.global_position
	var right_pos = start_pos + Vector2(400, 0)
	var tween = create_tween()
	# 先移动到右侧画面
	tween.tween_property(camera, "global_position", right_pos, 1.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

	# 停顿一下（1秒后再回来）
	tween.tween_interval(1.0)

	# 再回到原位置
	tween.tween_property(camera, "global_position", start_pos, 1.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.finished.connect(func():
		print("镜头回来了，可以开始游戏了！")
	)
