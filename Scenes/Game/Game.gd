extends Node2D

const WINDOW_WIDTH = 960
const WINDOW_HEIGHT = 540

onready var player = $Player
onready var ground = $Ground
onready var clouds = $Clouds
const groundChains = [
	preload("res://Nodes/Ground/GroundChain1.tscn"),
	preload("res://Nodes/Ground/GroundChain2.tscn"),
	preload("res://Nodes/Ground/GroundChain3.tscn"),
	preload("res://Nodes/Ground/GroundChain4.tscn"),
	preload("res://Nodes/Ground/GroundChain5.tscn"),
	preload("res://Nodes/Ground/GroundChain6.tscn"),
]
const cloud = preload("res://Nodes/Cloud/Cloud.tscn")

var speed = 5
var counter = 0

func _ready():
	randomize()
	VisualServer.set_default_clear_color(Color("#87CEEB"))
	setTopScore()


func _physics_process(delta):
	generateGroundAndCloud()
	restartGame()	

	
func generateGroundAndCloud():
	if counter == 36 * speed:
		counter = 0
		var groundChainInstance = getGroundChain().instance()
		groundChainInstance.position = Vector2(WINDOW_WIDTH, getGroundYPosition())
		ground.add_child(groundChainInstance)
		
		var cloudInstance = cloud.instance()
		clouds.add_child(cloudInstance)
		
	counter += 1

	
func restartGame():
	# set new high score
	if player.global_position.y > 576:
		if player.score > SaveSystem.gameData.highScore:
			$UI/NewHighScore.visible = true
			SaveSystem.gameData.highScore = player.score
			SaveSystem.save()
	
	# delay scene restart
	if player.global_position.y > 3000:
		get_tree().reload_current_scene()


func getGroundChain() -> Node2D:
	return groundChains[rand_range(0, 6)]


func getGroundYPosition() -> int:
	if int(rand_range(0, 2)) == 0:
		return 480
	else:
		return 384


func setTopScore():
	$UI/HighScore.text = "HIGH SCORE: " + str(SaveSystem.gameData.highScore)
