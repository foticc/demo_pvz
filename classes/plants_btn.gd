extends TextureButton

@export var plant_scene: PackedScene


func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed()->void:
	get_tree().call_group("game","start_placing_plant",plant_scene)
