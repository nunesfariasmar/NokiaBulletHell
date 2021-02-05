extends Node2D


var _original_position:Vector2 = Vector2()
var _position:Vector2 = Vector2()
var _velocity:Vector2 = Vector2()


func _ready() -> void:
	_original_position = position
	self.z_as_relative = false
	self.z_index = 1


#func _process(delta: float) -> void:
#	_velocity.y -= 60.0 * delta
#	_position += _velocity * delta
#	if _position.y < 0:
#		_velocity.y -= _position.y
#		_position.y = 0.0
#	position = _original_position - _position


func _input(event: InputEvent) -> void:
	if (event.is_action("move_left") && self.global_position.x > 2):
		self.position.x -= 1
	if (event.is_action("move_right") && self.global_position.x < 81):
		self.position.x += 1
	if (event.is_action("move_up") && self.global_position.y > 3):
		self.position.y -= 1;
	if (event.is_action("move_down") && self.global_position.y < 44):
		self.position.y += 1;
