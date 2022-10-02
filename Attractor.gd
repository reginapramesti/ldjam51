extends Area2D

func _process(delta):
	var vel = get_global_mouse_position() - global_position
	global_position += vel
