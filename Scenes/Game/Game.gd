extends Node2D

onready var player = $Player 
const groundChains = [
	preload("res://Nodes/Ground/GroundChain1.tscn"),
	preload("res://Nodes/Ground/GroundChain2.tscn"),
	preload("res://Nodes/Ground/GroundChain3.tscn"),
	preload("res://Nodes/Ground/GroundChain4.tscn"),
	preload("res://Nodes/Ground/GroundChain5.tscn"),
	preload("res://Nodes/Ground/GroundChain6.tscn"),
]

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
		var groundChainInstance = getGroundChain().instance()
		groundChainInstance.position = Vector2(960, getGroundYPosition())
		add_child(groundChainInstance)

	counter += 1

func restartGame():
	if player.global_position.y > 2000:
		get_tree().reload_current_scene()


func getGroundChain() -> Node2D:
	return groundChains[rand_range(0, 6)]

func getGroundYPosition() -> int:
	if int(rand_range(0, 2)) == 0:
		return 480
	else:
		return 384
