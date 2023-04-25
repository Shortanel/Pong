extends Node

class_name PlayerInput

var player

func _ready():
	player = get_parent()

func handle_input():
	if not "direction" in player:
		return
	
	player.direction = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		player.direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		player.direction.y += 1
