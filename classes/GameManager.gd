extends Node

var init_sun:int = 100
var current_sun:int = init_sun

signal sun_change(sun_count:int)

func _ready() -> void:
	pass


func add_sun()->void:
	self.current_sun = clamp(self.current_sun + 20, 0, 99999)
	self.sun_change.emit(self.current_sun)

func subtract_sun(count:int)->void:
	self.current_sun = clamp(self.current_sun - count, 0, 99999)
	self.sun_change.emit(self.current_sun)
