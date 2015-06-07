
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

# EXPORT
export var walk_speed = 225
export var walk_acceleration = 8
export var air_acceleration = 3

# INPUT
var player_right = Input.is_action_pressed("player_right")
var player_left = Input.is_action_pressed("player_left")
var player_jump = Input.is_action_pressed("player_jump")

# SENSORS

# INTERNAL
var current_speed=Vector2(0, 0)

func move(speed, acceleration, delta):
	current_speed.x = lerp( current_speed.x, speed, acceleration * delta )
	set_linear_velocity( Vector2( current_speed.x, get_linear_velocity().y ) )
	

func _ready():
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	# refreshing INPUT
	player_right = Input.is_action_pressed("player_right")
	player_left = Input.is_action_pressed("player_left")
	player_jump = Input.is_action_pressed("player_jump")

	if player_right:
		move(walk_speed, walk_acceleration, delta)
	elif player_left:
		move(-walk_speed, walk_acceleration, delta)
	else:
		move(0, walk_acceleration, delta)
	
	#if player_jump & 