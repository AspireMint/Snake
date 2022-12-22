extends SnakeSegment

class_name Tail

var prev_tail: SnakeSegment
var max_distance: int = 50

func _physics_process(delta):
	if not prev_tail:
		return
	
	var pos = transform.origin
	var move_to = prev_tail.transform.origin
	var dist = move_to.distance_to(pos)
	
	global_rotation = move_to.angle_to_point(pos)
	
	if dist < max_distance:
		return
	
	var walk_dir = pos.direction_to(move_to)
	var step = walk_dir * delta * move_speed
	var step_length = step.distance_to(Vector2.ZERO)
	
	if dist < step_length:
		transform.origin = move_to
	else:
		transform.origin += step
	
