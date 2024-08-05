extends Node

var difficulty: String = "normal"

func set_difficulty(diff: String) -> void:
	difficulty = diff

func get_difficulty() -> String:
	return difficulty
