extends Node2D

# Declare member variables here. Examples:
var bullet_scene = load("res://scenes/Bullet.tscn")
var bullet_variations = [Vector2(-1,0), Vector2(-1,1), Vector2(0,1), Vector2(1,1), Vector2(1,0),
	Vector2(-1,-1), Vector2(1,-1), Vector2(0,-1)]
var b = bullet_scene.instance()


# Called when the node enters the scene tree for the first time.
func _ready():		
	randomize()
	rotation_degrees = randi() % 360
	var bullets = [get_child(0), get_child(1), get_child(2), get_child(3), get_child(4), get_child(5),
	 get_child(6), get_child(7)]
	bullets[0].variation = bullet_variations[0]
	bullets[1].variation = bullet_variations[1]
	bullets[2].variation = bullet_variations[2]
	bullets[3].variation = bullet_variations[3]
	bullets[4].variation = bullet_variations[4]
	bullets[5].variation = bullet_variations[5]
	bullets[6].variation = bullet_variations[6]
	bullets[7].variation = bullet_variations[7]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):	
#	pass
