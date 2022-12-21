extends StaticBody2D

const FALL_SPEED = 5
const RANDOM_LIMIT = 2500

var fall: bool = false
var fallNumber: int = int(rand_range(0, RANDOM_LIMIT))

func _ready():
	randomize()
	addRubyRandomly()
	
func _physics_process(_delta):
	var randomNumber = int(rand_range(0, RANDOM_LIMIT))
	if randomNumber == fallNumber:
		fall = true
		
	if fall:
		position.y += FALL_SPEED

func addRubyRandomly():
	if int(rand_range(0, 5)) == 0:
		var ruby = preload("res://Nodes/Ruby/Ruby.tscn").instance()
		ruby.position = Vector2(48, -144)
		add_child(ruby)
