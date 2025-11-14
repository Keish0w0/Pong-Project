extends Sprite2D

var score := [0, 0]

func _on_score_left(_body) -> void:
	score[1] += 1
	$UI/ScoreP2.text = str(score[1])
	$Ball.score()
	
func _on_score_right(_body) -> void:
	score[0] += 1
	$UI/ScoreP1.text = str(score[0])
	$Ball.score()
