extends Node2D
class_name PeaShooter


@onready var marker_2d: Marker2D = $Marker2D
@onready var shoot_timer: Timer = $ShootTimer

var pull = preload("res://tscn/pea_bullet.tscn")

func _ready() -> void:
	self.shoot_timer.timeout.connect(_shoot)


func _shoot() ->void:
	var instance:PeaBullet = pull.instantiate()
	instance.position = marker_2d.position
	add_child(instance)
