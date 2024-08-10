extends Node

var difficulty: String = "normal"
var player_name = ""
#var highscores: Dictionary


func set_difficulty(diff: String) -> void:
	difficulty = diff

func get_difficulty() -> String:
	return difficulty
