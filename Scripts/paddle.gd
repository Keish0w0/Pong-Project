extends CharacterBody2D

@export var player_id: int

@export var max_speed: float = 125
@export var accel: float = 6
@export var friction: float = 8

var input: int

func get_input():
	input = int(Input.get_action_strength('down_%d' % player_id)) - int(Input.get_action_strength('up_%d' % player_id))
	return input

func _physics_process(delta: float) -> void:
	input = get_input()
	
	var lerp_weight = delta * (accel if input else friction)
	velocity.y = lerp(velocity.y, input * max_speed, lerp_weight)
	
	move_and_slide()
