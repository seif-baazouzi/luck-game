extends Node

const GAME_DATA_FILE = "user://game-data.res"

var gameData: GameData

func _ready():
	if ResourceLoader.exists(GAME_DATA_FILE):
		gameData = ResourceLoader.load(GAME_DATA_FILE)
	else:
		gameData = GameData.new()

	
func save():
	var result = ResourceSaver.save(GAME_DATA_FILE, gameData)
	assert(result == OK)
