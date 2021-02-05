extends Node2D


var _original_position:Vector2 = Vector2()
var _position:Vector2 = Vector2()
var _velocity:Vector2 = Vector2()


func _ready() -> void:
	_original_position = position
	self.z_as_relative = false
	self.z_index = 0


func _process(delta: float) -> void:
	if($RayCast2D.is_colliding()):
		print("Ayy")
		


func _input(event: InputEvent) -> void:
	if (event.is_action("move_left") && self.global_position.x > 2):
		self.position.x -= 1
	if (event.is_action("move_right") && self.global_position.x < 81):
		self.position.x += 1
	if (event.is_action("move_up") && self.global_position.y > 3):
		self.position.y -= 1;
	if (event.is_action("move_down") && self.global_position.y < 44):
		self.position.y += 1;
