extends Node2D

signal score_left
signal score_right

func _on_ScoreLeft_body_entered(_body):
	emit_signal("score_left")



func _on_ScoreRight_body_entered(_body):
	emit_signal("score_right")
