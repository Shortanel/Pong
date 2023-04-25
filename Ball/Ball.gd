extends KinematicBody2D

export var initial_speed = 300
export var speed_comulator = 50
var speed = initial_speed

var hit_counter = 0
var max_hit_counter = 12
var direction = Vector2()
var x = 1

func _ready():
	$StartTimer.start()

func _physics_process(delta):
	var collision = move_and_collide(direction * delta)
	
	if collision:
		direction = direction.bounce(collision.normal)
		print(collision.collider.name)
		if collision.collider.is_in_group("rackets"):
			var y = direction.y /2 + collision.collider_velocity.y
			
			direction = Vector2(direction.x,y).normalized() * (speed + hit_counter * speed_comulator)
		
			if hit_counter < max_hit_counter:
				hit_counter += 1
			
			$Racket_hit.play()
			
		else:
			$Wall_hit.play()


func set_initial_direction():
	var  random_x = 0 
	
	if randi()%10 < 5:
		random_x = 1
	else:
		random_x = -1
	
	direction = Vector2(random_x, rand_range(-1,1))
	direction = direction.normalized() * speed

func reset():
	self.position = Vector2(512,300)
	direction = Vector2()
	hit_counter = 0
