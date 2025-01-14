extends CharacterBody2D

class_name Ball

@export var Lives = 3
@export var Speed = 20  
@export var MaxSpeed = 100
@export var SpeedIncrement = 1.5
@export var deathZone: DeathZone

signal ball_lost

var start_position: Vector2 

func _ready():
	start_position = position 
	deathZone.life_lost.connect(on_life_lost)
	
func on_life_lost():
	Lives = Lives - 1
	velocity = Vector2.ZERO
	position = start_position
	ball_lost.emit()
	print(Lives)

func start_ball():
	start_position = position
	randomize()	
	velocity = Vector2(randf_range(-1,1),randf_range(-.1,-1))

func _physics_process(delta):
	var collision = move_and_collide(velocity * Speed * delta * 50)
	if !collision:
		return		
	velocity = velocity.bounce(collision.get_normal())
