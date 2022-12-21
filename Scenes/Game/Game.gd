extends Node2D

onready var player = $Player 
const groundChain = preload("res://Nodes/Ground/GroundChain.tscn")

var speed = 5
var counter = 0

func _ready():
	randomize()
	VisualServer.set_default_clear_color(Color("#87CEEB"))

func _physics_process(delta):
	generateGround()
	restartGame()	
	
func generateGround():
	if counter == 36 * speed:
		counter = 0
		var groundChainInstance = groundChain.instance()
		groundChainInstance.position = Vector2(960, get_ground_y_position())
		add_child(groundChainInstance)

	counter += 1

func restartGame():
	if player.global_position.y > 2000:
		get_tree().reload_current_scene()


func get_ground_y_position() -> int:
	if int(rand_range(0, 2)) == 0:
		return 480
	else:
		return 384
