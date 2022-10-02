extends RigidBody2D

var thrust = Vector2(0, -250)
var torque = 8000
var jump = 0.5
var side_force = 10
onready var anim = $AnimationPlayer

onready var gravity = get_parent().get_node("Gravity")
var velocity = Vector2()

func _integrate_forces(state):
	
	var up = -1 * (gravity.transform.origin - self.transform.origin)
	
	if Input.is_action_pressed("ui_right"):
		apply_central_impulse(up.tangent().normalized() * -side_force)
	if Input.is_action_pressed("ui_left"):
		apply_central_impulse(up.tangent().normalized() * side_force)
	
#	var rotation_dir = 0
#	if Input.is_action_pressed("ui_right"):
#		rotation_dir += 1
#	if Input.is_action_pressed("ui_left"):
#		rotation_dir -= 1
#	applied_torque = rotation_dir * torque
		
	anim.play("clock_ticking")
	
	if Input.is_action_pressed("ui_up"):
		if (gravity.transform.origin.distance_to(self.transform.origin) < 190):
			apply_central_impulse(jump * up)
	


