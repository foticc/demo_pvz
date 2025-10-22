extends Area2D
class_name PeaBullet

var speed:int = 200;
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D


func _ready() -> void:
	self.visible_on_screen_notifier_2d.screen_exited.connect(queue_free)

func _process(delta: float) -> void:
	self.position.x+=delta * speed
