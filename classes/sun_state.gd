extends TextureRect

@onready var label: Label = $Label

func _ready() -> void:
	label.text = str(GameManager.current_sun)
	GameManager.sun_change.connect(func(count):
		self.label.text = str(count)
	)
