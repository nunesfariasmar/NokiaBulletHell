extends Node2D

# Declare member variables here. Examples:
var variation:Vector2 = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(variation != Vector2(0,0)):
		self.position += variation
	if (self.global_position.x > 84 || self.global_position.x < 0):
		self.queue_free()
	elif(self.global_position.y > 48 || self.global_position.y < 0):
		self.queue_free()
