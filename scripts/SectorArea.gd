extends Area2D

onready var timer = $Timer
const rotation_increments = PI/30
const wait_time = 1

func _ready():
	timer.connect("timeout", self, "update_rotation")
	timer.wait_time = wait_time
	timer.start()
	print(timer)
	
func update_rotation():
	rotate(rotation_increments)
