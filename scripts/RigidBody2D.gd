extends RigidBody2D

var thrust = Vector2(0, -250)
var torque = 8000
var jump = 0.5
var side_force = 10
onready var anim = $AnimationPlayer
var in_cone = true

onready var gravity = get_parent().get_node("Gravity")
var velocity = Vector2()

func _integrate_forces(state):
	if in_cone:
		var up = -1 * (gravity.transform.origin - self.transform.origin)
		
		if Input.is_action_pressed("ui_right"):
			apply_central_impulse(up.tangent().normalized() * -side_force)
		if Input.is_action_pressed("ui_left"):
			apply_central_impulse(up.tangent().normalized() * side_force)
		
		anim.play("clock_ticking")
		
		if Input.is_action_pressed("ui_up"):
			if (gravity.transform.origin.distance_to(self.transform.origin) < 190):
				apply_central_impulse(jump * up)

func _on_SectorArea_body_exited(body):
	print('leaving cone')
	modulate = Color(0.5, 0.5, 0.5)
	sleeping = true
	in_cone = false
	
func _on_SectorArea_body_entered(body):
	print('entering cone')
	sleeping = false
	modulate = Color("#fff")
	apply_central_impulse(Vector2(0.01, 0.01))
	in_cone = true
