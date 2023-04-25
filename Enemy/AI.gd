extends KinematicBody2D

export var speed = 200

var direction = Vector2()

func _ready():
	add_to_group("rackets")

func _process(_delta):
	$AI_Input.calculate_velocity()

func _physics_process(delta):
	if direction.length() > 0:
		direction = direction.normalized() * speed
		move_and_collide(direction * delta)

func reset():
	self.position = Vector2(999,300)
