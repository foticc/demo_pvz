extends Node2D
class_name SunFlower

@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var sun_timer: Timer = $SunTimer
@onready var sun_transformer_timer: Timer = $SunTransformerTimer


var sun_ready:bool = false:
	set(v):
		sun_ready = v
		animated_sprite_2d.play("sun" if v else "default")


var preview:Texture2D = null;

func _ready() -> void:
	sun_timer.timeout.connect(_on_timer_out)
	sun_transformer_timer.timeout.connect(_on_sun_transformer)

func get_preview()->Texture2D:
	if preview:
		return preview
	self.preview = animated_sprite_2d.sprite_frames.get_frame_texture("default",0)
	return preview

func _on_timer_out()->void:
	var sun = preload("res://tscn/sun.tscn").instantiate()
	sun.position = position
	get_tree().current_scene.add_child(sun)
	sun_ready = false

func _on_sun_transformer()->void:
	sun_ready = true
