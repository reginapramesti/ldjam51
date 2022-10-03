extends Node2D

var rotation_angle = 6
var angle_from = 0
var angle_to = 60
onready var timer = $Timer
const wait_time = 1

func _draw():
	var center = Vector2(0, 0)
	var radius = 1200
	var color = Color(0.0, 1.0, 0.0, 0.3)
	draw_circle_arc_poly(center, radius, angle_from, angle_to, color)
	
func _ready():
	timer.connect("timeout", self, "update_angle")
	timer.wait_time = wait_time
	timer.start()
	
func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PoolVector2Array()
	points_arc.push_back(center)
	var colors = PoolColorArray([color])

	for i in range(nb_points + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	draw_polygon(points_arc, colors)

func update_angle():
	angle_from += rotation_angle
	angle_to += rotation_angle
	if angle_from > 360 and angle_to > 360:
		angle_from = wrapf(angle_from, 0, 360)
		angle_to = wrapf(angle_to, 0, 360)
	update()
	
