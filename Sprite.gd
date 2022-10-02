extends KinematicBody2D

const WALK_SPEED = 200
const GRAVITY = 400

var velocity = Vector2()
var planet

func _ready():
	planet = get_parent().get_node("Circle")
	print(planet)

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0

	if is_on_floor():
		print(get_floor_angle())


	move_and_slide(velocity, get_floor_normal() * -1)

func get_gravity_dir_vector():
	return (planet.transform.origin - transform.origin).normalized()
