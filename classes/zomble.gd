extends Area2D
class_name Zombie

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animated_sprite_2d_2: AnimatedSprite2D = $AnimatedSprite2D2

var can_take_damage = true
var is_play = false

var hit_count = 2
var max_hit_count = 8
var current_hit_count = 0

var state: State = State.MOVE


enum State {
	DI,
	MOVE,
	EAT,
	LOST_EAT,
	LOST_MOVE
}

func _ready() -> void:
	self.area_entered.connect(_on_area_entered)

func _process(delta: float) -> void:
	match state:
		State.MOVE:
			position += Vector2(-delta * 50,0)


func _on_area_entered(area:Area2D)->void:
	if area is PeaBullet:
		if not can_take_damage:
			return
		self.current_hit_count = clamp(current_hit_count + 1,0,hit_count)
		self.can_take_damage = false
		if current_hit_count >= hit_count and current_hit_count <= max_hit_count:
			if not is_play:
				self.animated_sprite_2d_2.visible = true
				self.animated_sprite_2d_2.play("default")
				self.animated_sprite_2d_2.visible = false
				is_play = true
			self.animated_sprite_2d.play("lost_move")
		elif current_hit_count > max_hit_count:
			self.animated_sprite_2d.play("new_animation")
			await get_tree().create_timer(2).timeout
			queue_free()
		self.can_take_damage = true
