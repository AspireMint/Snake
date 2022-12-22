extends Node2D

class_name Snake

onready var head: SnakeSegment = $Head
onready var tail: SnakeSegment

func _input(event: InputEvent):
	event = event as InputEventMouseButton
	if not event or not event.button_index == BUTTON_LEFT or not event.pressed:
		return
	
	var new_tail: Tail
	
	if tail:
		new_tail = tail.duplicate()
		new_tail.prev_tail = tail
	else:
		new_tail = load("res://snake/tail/tail.tscn").instance()
		new_tail.prev_tail = head
		new_tail.position = head.position
		new_tail.rotation = head.rotation
	
	new_tail.scale = new_tail.prev_tail.scale * 0.9
	new_tail.max_distance = new_tail.max_distance * new_tail.scale.x
	tail = new_tail
	
	add_front(new_tail)

func add_front(segment):
	var children = get_children()
	
	for child in children:
		remove_child(child)
	
	add_child(segment)
	
	for child in children:
		add_child(child)
