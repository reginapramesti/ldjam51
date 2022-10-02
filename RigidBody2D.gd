extends RigidBody2D

var thrust = Vector2(0, -250)
var torque = 10000

func _integrate_forces(state):
	var rotation_dir = 0
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
	applied_torque = rotation_dir * torque

#var move_direction = Vector2()
#var last_strong_direction = Vector2()
#var local_gravity = Vector2()
#onready var model = get_node(".")
#
#func _integrate_forces(state):
#
#	local_gravity = state.total_gravity.normalized()
#	print(local_gravity)
#
#	move_direction = get_model_oriented_input()
#
#	orient_character_to_direction(last_strong_direction, state.step)
#
#func get_model_oriented_input():
#	var input_left_right = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
#	var input_up = Input.get_action_strength("ui_up")
#
#	return Vector2(input_left_right, 0)
#
#func orient_character_to_direction(direction, delta):
#	var left_axis = -local_gravity.cross(direction)
#	var rotation_basis = Basis(left_axis, -local_gravity, direction).orthonormalized()
#	model.transform.basis = model.transform.basis.get_rotation_quat().slerp(
#		rotation_basis, delta * rotation_speed
#	)
#	pass
