extends KinematicBody2D

const GRAVITY = 400.0
const WALK_SPEED = 200

var velocity = Vector2()
var rng = RandomNumberGenerator.new()

func _input(event):
	if event.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = -GRAVITY

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
	
	move_and_slide(velocity, Vector2(0, -1))



func _on_Area2D_body_entered(body):
	print("hi")
