extends RichTextLabel


# Declare member variables here. Examples:
const TIME_INTERVAL = 3
var time = 0
var phase = 1
var Player = load("res://scenes/Player.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if(time > TIME_INTERVAL):
		if(phase == 2):
			var p = Player.instance()
			p.global_position = Vector2(20, 40)
			get_parent().get_parent().add_child(p)
			get_parent().get_child(1).visible = true
#			get_parent().get_parent().get_parent().get_child(1).visible = true
			get_parent().started = true
			self.free()
		elif(phase == 1):
			self.bbcode_text = "[shake rate=10 level=7]Fight me![/shake]"
			time = 0
			phase = 2
	pass
