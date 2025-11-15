extends Sprite2D
class_name Main

var score := [0, 0]
var paused: bool = false

func _ready() -> void:
	$Player2.is_cpu = global.is_cpu
	$UI/PauseMenu.hide()
	Engine.time_scale = 1

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		print("Pause")
		pause_menu()

func pause_menu():
	if paused:
		$UI/PauseMenu.hide()
		Engine.time_scale = 1
	else: 
		$UI/PauseMenu.show()
		Engine.time_scale = 0
	paused = !paused

func _on_score_left(_body) -> void:
	score[1] += 1
	$UI/ScoreP2.text = str(score[1])
	$Ball.score()
	
func _on_score_right(_body) -> void:
	score[0] += 1
	$UI/ScoreP1.text = str(score[0])
	$Ball.score()

	
