class_name Plant
extends Node2D

@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var preview:Texture2D = null;

func _ready() -> void:
	self.preview = animated_sprite_2d.sprite_frames.get_frame_texture("default",0)
