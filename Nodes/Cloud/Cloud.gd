extends Sprite

export(int) var speed = 2

const WINDOW_WIDTH = 960
const WINDOW_HEIGHT = 540

func _ready():
	randomize()
	
	var cloudNumber = int(rand_range(0, 6)) + 1
	texture = load("res://Textures/clouds/cloud-" + str(cloudNumber) + ".png")
	position = Vector2(WINDOW_WIDTH*1.5, rand_range(0, WINDOW_HEIGHT))

func _physics_process(_delta):
	position.x -= speed
	
	if global_position.x < -WINDOW_WIDTH:
		queue_free()
