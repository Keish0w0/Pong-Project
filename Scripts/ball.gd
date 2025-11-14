extends CharacterBody2D
class_name Ball

const speed: float = 10

func _ready() -> void: initialize()

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		
func initialize():
	var offset = 0 if randf() <= 0.5 else PI
	var angle = offset + randf_range(-PI/3, PI/3)
	velocity = Vector2(cos(angle),sin(angle)).normalized() * speed
	position = get_viewport_rect().size / 2

func score() -> void:
	await get_tree().create_timer(1.0).timeout
	initialize()
