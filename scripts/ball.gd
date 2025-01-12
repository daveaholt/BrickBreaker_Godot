extends CharacterBody2D

class_name Ball

@export var Speed = 20  
@export var MaxSpeed = 100
@export var SpeedIncrement = 1.5

var start_position: Vector2 

func _ready():
	start_position = position 

func start_ball():
	start_position = position
	randomize()
	
	velocity = Vector2(randf_range(-1,1),randf_range(-.1,-1))

func _physics_process(delta):
	move_and_collide(velocity * Speed * delta * 50)
