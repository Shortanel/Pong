extends Node2D

var score_player = 0
var score_enemy = 0

var max_score = 3

onready var hud = get_node("HUD")

func ready():
	update_score()

func _process(delta):
	if $Ball/StartTimer.time_left > 1:
		get_node("HUD/Control/CountDownContainer/CenterContainer/TimeLeft").set_text(str(round($Ball/StartTimer.time_left)))

func _on_Arena_score_left():
	score_enemy += 1
	
	if score_enemy < max_score:
		start_new_round()
	else:
		show_winner("You Lose")
	
	update_score()


func _on_Arena_score_right():
	score_player += 1
	
	if score_player < max_score:
		start_new_round()
	else:
		show_winner("You Win!")
	
	update_score()

func start_new_game():
	score_player = 0
	score_enemy = 0
	update_score()
	$FinalScreen/Control.set_visible(false)
	start_new_round()

func start_new_round():
	$Ball.reset()
	$Player.reset()
	$AI.reset()
	hud.get_node("Control/CountDownContainer").set_visible(true)
	$Ball/StartTimer.start()


func _on_StartTimer_timeout():
	hud.get_node("Control/CountDownContainer").set_visible(false)
	$Ball.set_initial_direction()
	$Ball/Ball_Skin.play()

func update_score():
	hud.get_node("Control/ScoreContainer/ScorePlayer").set_text(str(score_player))
	hud.get_node("Control/ScoreContainer/ScoreEnemy").set_text(str(score_enemy))

func show_winner(message):
	$FinalScreen/Control.set_visible(true)
	$FinalScreen.get_node("Control/Result/Label").set_text(message)


func _on_FinalScreen_retry():
	start_new_game()


func _on_FinalScreen_exit():
	get_tree().quit()
