extends RigidBody2D

var half_paddle_x:float
var half_screen_x:float
var direction = Vector2.ZERO
var camera_rect: Rect2

@export var Camera: Camera2D
@export var Speed = 200

func _ready():
	camera_rect = Camera.get_viewport_rect()
	half_screen_x = camera_rect.size.x / 2
	half_paddle_x = $Sprite2D.texture.get_width() / 8
	
func _physics_process(delta):
	linear_velocity = direction * Speed
	
func _process(delta):	
	if global_position.x < Camera.position.x - (half_screen_x - half_paddle_x):
		global_position.x = Camera.position.x - (half_screen_x - half_paddle_x)
	elif global_position.x > Camera.position.x + (camera_rect.size.x / 2- half_paddle_x):
		global_position.x = Camera.position.x + (camera_rect.size.x / 2 - half_paddle_x)

func _input(event):
	if Input.is_action_pressed("Left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("Right"):
		direction = Vector2.RIGHT
	else:
		direction = Vector2.ZERO

