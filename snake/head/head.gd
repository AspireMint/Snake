extends SnakeSegment

class_name Head

var move_to = Vector2.ZERO

func _input(event: InputEvent):
	if event as InputEventKey:
		return

	move_to = event.position
	global_rotation = move_to.angle_to_point(global_position)

func _physics_process(delta):
	var pos = global_position
	var dist = move_to.distance_to(pos)
	
	if dist == 0:
		return
	
	var walk_dir = pos.direction_to(move_to)
	var step = walk_dir * delta * move_speed
	var step_length = step.distance_to(Vector2.ZERO)
	
	if dist < step_length:
		global_position = move_to
	else:
		global_position += step
