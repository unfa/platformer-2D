
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

export var walk_speed = 200

func _ready():
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	set_linear_velocity(Vector2(self.walk_speed,get_linear_velocity().y))