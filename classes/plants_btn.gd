extends TextureButton

@export var preview: Texture2D
@onready var progress_bar: TextureProgressBar = $TextureProgressBar

var sun_cost_count = 50

func _ready() -> void:
	pressed.connect(_on_pressed)
	progress_bar.max_value = sun_cost_count
	_set_sun_count(GameManager.current_sun)
	GameManager.sun_change.connect(_set_sun_count)

func _on_pressed()->void:
	get_tree().call_group("game","start_placing_plant",preview)


func _set_sun_count(count:int)->void:
	if sun_cost_count > count:
		self.disabled = true
		self.progress_bar.value = count
	else:
		self.progress_bar.value = 0
		self.disabled = false
