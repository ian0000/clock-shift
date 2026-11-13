class_name MainController
extends Node
@export var game: GameData

var _path: String= "user://game.tres"

func save_game():
	game.count_death = GlobalController.death_count
	game.items = GlobalController.items
	game.time = GlobalController.time
	game.phase = GlobalController.phase
	
	ResourceSaver.save(game, _path)
	
func  load_game():
	if ResourceLoader.exists(_path):
		game = load(_path)
		GlobalController.death_count = game.count_death
		GlobalController.items = game.items
		GlobalController.time = game.time
		GlobalController.phase = game.phase
		
		GlobalController.start_timer_signal()
