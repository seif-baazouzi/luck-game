extends Node2D

onready var player = $Player
onready var ground = $Ground
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
	setTopScore()

func _physics_process(delta):
	generateGround()
	restartGame()	
	
func generateGround():
	if counter == 36 * speed:
		counter = 0
		var groundChainInstance = getGroundChain().instance()
		groundChainInstance.position = Vector2(960, getGroundYPosition())
		ground.add_child(groundChainInstance)

	counter += 1

func restartGame():
	if player.global_position.y > 576:
		var data = loadData()

		var score = data["score"]
		if data["score"] == null:
			score = 0
		
		if player.score > score:
			$UI/NewHighScore.visible = true
			data["score"] = player.score
			saveData(data)
		
		yield(get_tree().create_timer(3), "timeout")
		get_tree().reload_current_scene()


func getGroundChain() -> Node2D:
	return groundChains[rand_range(0, 6)]

func getGroundYPosition() -> int:
	if int(rand_range(0, 2)) == 0:
		return 480
	else:
		return 384

func setTopScore():
	var data = loadData()
	
	var score = 0
	if "score" in data:
		score = data["score"]
	
	$UI/HighScore.text = "HIGH SCORE: " + str(score)

##############################
######### save data ##########
##############################

var dataFile = File.new()
		
func loadData():
	var err = dataFile.open("user://data.json", File.READ)
	if err:
		return { "score": 0 }
		
	var dataJson = JSON.parse(dataFile.get_as_text())
	dataFile.close()
	
	return dataJson.result

func saveData(data):
	dataFile.open("user://data.json", File.WRITE)
	dataFile.store_line(JSON.print(data))
	dataFile.close()

