extends Node2D


# Declare member variables here. Examples:
export (Texture) var texture setget _set_texture
var radius = 5
var multiplier = 0
var color = Color(0, 0.0, 0.0)
var last_white = 0


func _set_texture(value):
	# If the texture variable is modified externally,
	# this callback is called.
	texture = value  # Texture was changed.
	update()  # Update the node's visual representation.


# Called when the node enters the scene tree for the first time.
func _ready():
	multiplier = 10
	self.z_as_relative = false
	self.z_index = 0
	pass # Replace with function body.
	
func _draw(): 
	var center = Vector2(0,0)
	var angle_from = 0
	var angle_to = 360
	draw_circle_arc(center, radius, angle_from, angle_to, color)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	radius += 1	
	self.get_child(0).shape.radius = radius + (5/2)
	print(self.get_child(0).shape.radius)
	if(last_white + 10 == radius): 
		color = Color(0,0,0)
	elif(radius % multiplier == 0): 
		color = Color(0.75,0.75,0.75)
		last_white = radius
	if(radius > 84):
		self.free()
	else:
		update()	
	pass

func draw_circle_arc(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = []
	
	for i in range(nb_points + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	
	for index_point in range(nb_points):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color, 5)
