extends Node2D

@onready var camera: Camera2D = $Camera2D

var current_plant_scene = null
@onready var preview: Sprite2D = $PlantPreview

var start_plant:bool = false

func _ready() -> void:
	add_to_group("game")
	preview.visible = false
	#_move_camera()

func start_placing_plant(texture:Texture2D,packed:PackedScene)->void:
	if texture:
		preview.texture = texture  # 假设植物有 texture
		preview.visible = true
	if packed:
		current_plant_scene = packed
	start_plant = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _process(_delta)->void:
	if preview.visible:
		preview.global_position = get_global_mouse_position()


func plant(pos:Vector2)->void:
	if not start_plant:
		return
	var instance = current_plant_scene.instantiate()
	instance.position  = pos
	get_tree().current_scene.add_child(instance)
	start_plant = false
	preview.visible = false
	GameManager.subtract_sun(50)





func _move_camera()->void:
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
