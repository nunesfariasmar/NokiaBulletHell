extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _position:Vector2 = Vector2()
var _velocity:Vector2 = Vector2()
var _original_position:Vector2 = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta: float) -> void:
	_velocity.y -= 60.0 * delta
	_position += _velocity * delta
	if _position.y < 0:
		_velocity.y -= _position.y
		_position.y = 0.0
	position = _original_position - _position


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
