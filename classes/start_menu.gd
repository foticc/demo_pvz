extends Control

@onready var start_btn: TextureButton = $start_btn

func _ready() -> void:
	self.start_btn.pressed.connect(_start_game)
	

func _start_game()->void:
	get_tree().change_scene_to_file("res://tscn/main.tscn")
