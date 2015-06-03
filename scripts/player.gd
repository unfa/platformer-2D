
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

# EXPORT

export var walk_speed = 225

# INPUT

var player_right = Input.is_action_pressed("player_right")
var player_left = Input.is_action_pressed("player_left")
var player_jump = Input.is_action_pressed("player_jump")

func _ready():
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	# refreshing INPUT
	player_right = Input.is_action_pressed("player_right")
	player_left = Input.is_action_pressed("player_left")
	player_jump = Input.is_action_pressed("player_jump")

	if player_right:
		set_linear_velocity(Vector2(self.walk_speed,get_linear_velocity().y))
	
	elif player_left:
		set_linear_velocity(Vector2(self.walk_speed*(-1),get_linear_velocity().y))
	else:
		set_linear_velocity(Vector2(0,get_linear_velocity().y))