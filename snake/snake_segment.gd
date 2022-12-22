extends KinematicBody2D

class_name SnakeSegment

var move_speed: int = 50

func _physics_process(delta):
	# HACKS!!!
	move_and_collide(Vector2.ZERO)
	
	# *neuralyzer noise*
	# Keep this function empty as it is now ;)
	pass
