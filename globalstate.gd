extends Node

var difficulty: String = "normal"
var player_name = ""
var save_data: Dictionary = {}

#var highscores: Dictionary


func set_difficulty(diff: String) -> void:
	difficulty = diff

func get_difficulty() -> String:
	return difficulty


func save_to_file(name: String, minutes: int, seconds: int, msec: int) -> void:
	save_data["name"] = Globalstate.player_name
	save_data["minutes"] = GlobalTimer.minutes
	save_data["seconds"] = GlobalTimer.seconds
	save_data["msec"] = GlobalTimer.msec

	var file = FileAccess.open("user://highscore.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data))
	file.close()

func load_from_file() -> void:
	var file = FileAccess.open("user://highscore.json", FileAccess.READ)
	if file:
		save_data = JSON.parse_string(file.get_as_text())
		print(JSON.parse_string(file.get_as_text()))
		file.close()
