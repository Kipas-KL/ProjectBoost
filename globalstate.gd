extends Node

var difficulty: String = "normal"
var player_name = ""
var save_data: Dictionary = {}
var highscores: Array = []




func set_difficulty(diff: String) -> void:
	difficulty = diff

func get_difficulty() -> String:
	return difficulty


func save_to_file(name: String, minutes: int, seconds: int, msec: int) -> void:
	var new_score: Dictionary = {
		"name": player_name,
		"minutes": minutes,
		"seconds": seconds,
		"msec": msec
	}
	
	highscores.append(new_score)
	
	#highscores.sort_custom(_compare_scores)
	
	if highscores.size() > 10:
		highscores.pop_back()

	var file = FileAccess.open("user://highscore.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(highscores))
	file.close()

func load_from_file() -> void:
	var file = FileAccess.open("user://highscore.json", FileAccess.READ)
	if file:
		var data = file.get_as_text()
		if data != "":
			highscores = JSON.parse_string(data)
			if typeof(highscores) != TYPE_ARRAY:
				highscores = []  # Fallback, falls die Daten keine gültige Liste sind
			else:
				highscores.sort_custom(_compare_scores)
				print(highscores)
		file.close()
		
		
		
		
func _compare_scores(a: Dictionary, b: Dictionary) -> int:
	# Vergleichsfunktion zum Sortieren der Highscores
	var time_a = a["minutes"] * 60000 + a["seconds"] * 1000 + a["msec"]
	var time_b = b["minutes"] * 60000 + b["seconds"] * 1000 + b["msec"]
	return time_a - time_b 








