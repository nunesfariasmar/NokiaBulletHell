extends Sprite

# Declare member variables here. Examples:
var bullet_Circle = load("res://scenes/BulletCircle.tscn")
var arch_Circle = load("res://scenes/ArchAttack.tscn")
var sprite1 = load("res://data/sprites/evil1.png")
var sprite2 = load("res://data/sprites/evil2.png")
const TIME_INTERVAL = 1
const NUM_WAVES = 10
var time = 0
var waves = 0
var phase = 1
var started = false
var phase1_set = false
var last_done = false
var multiplier_arcs = 3
var num_circles = 1

var healthbar = null #find_node("HealthBar")
var textBar = null
var health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	healthbar = self.get_child(1).get_child(0) 
	textBar = self.get_child(0)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!started): return
	time += delta
	if(phase == 0):		
		if(time > TIME_INTERVAL && waves < NUM_WAVES):
			for i in num_circles:
				var b = bullet_Circle.instance()
				b.z_index = 0
				add_child(b)
			time = 0
			waves += 1
		elif (waves == NUM_WAVES):
			set_texture(sprite1)
			time = 0
			waves = 0
			phase = 1		
		healthbar.value -= 0.1
	elif(phase == 1):
		if(!phase1_set):
			if(time > TIME_INTERVAL/2):
				set_texture(sprite2)
				phase1_set = true
		else:
			if(time > TIME_INTERVAL):				
				healthbar.value -= 0.1
			if(time > multiplier_arcs * TIME_INTERVAL && waves < NUM_WAVES):
				var a = arch_Circle.instance() 
				a.z_index = 0
				add_child(a)
				time = 0
				waves += 1
			elif (waves == NUM_WAVES):
				set_texture(sprite2)
				time = 0
				waves = 0
				if(last_done):
					phase = 2		
				else:
					phase = 0
					last_done = true
					multiplier_arcs = 1.5
					num_circles = 3
