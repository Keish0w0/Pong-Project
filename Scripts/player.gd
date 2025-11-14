extends CharacterBody2D
class_name Player

@export var player_id: int

@export var max_speed: float = 200
@export var accel: float = 6
@export var friction: float = 8
@export var is_cpu: bool = false

##CPU Properties
@onready var ball: Ball = $"../Ball"
var ball_pos: Vector2 
var distance: float

@onready var height: float = $CollisionShape2D.shape.get_rect().size.x 
var input: int

func get_input():
	input = int(Input.get_action_strength('down_%d' % player_id)) - int(Input.get_action_strength('up_%d' % player_id))
	return input

func _process(_delta: float) -> void:
	ball_pos = ball.position
	distance = ball_pos.y - position.y

func _physics_process(delta: float) -> void:
	input = get_input()
	
	var lerp_weight = delta * (accel if input else friction)
	if !is_cpu:
		velocity.y = lerp(velocity.y, input * max_speed, lerp_weight)
	else:
		if abs(distance) > max_speed * delta:
			velocity.y = lerp(velocity.y, sign(distance) * (max_speed * 0.95), accel * delta)
		else:
			velocity.y = distance
	velocity.x = 0
	move_and_slide()
