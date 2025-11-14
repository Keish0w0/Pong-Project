extends CharacterBody2D
class_name Ball

const speed: float = 200
var accel: float = 1
var direction: Vector2

const max_vector: float = 0.5

func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	initialize()

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction * (speed * accel) * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		if collider.has_method("get_input"):
			print(accel)
			direction = new_direction(collider)
			increase_accel()
		else: direction = direction.bounce(collision.get_normal())

func initialize():
	position = get_viewport_rect().size / 2
	direction = rand_direction()

func rand_direction():
	var new_direction := Vector2()
	new_direction.x = [1, -1].pick_random()
	new_direction.y = randf_range(-1, 1)
	return new_direction.normalized()

func new_direction(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var distance = ball_y - pad_y
	var new_dir := Vector2()
	
	if direction.x > 0: 
		new_dir.x = -1
	else: new_dir.x = 1
	new_dir.y = (distance / (collider.height / 2)) * max_vector
	return new_dir.normalized()

func score() -> void:
	await get_tree().create_timer(1.0).timeout
	accel = 1
	initialize()

func increase_accel():
	accel += 0.05
