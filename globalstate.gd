extends Node

var difficulty: String = "normal"
var player_name = ""
var save_data: Dictionary = {}
var highscores_normal: Array = []
var highscores_hard: Array = []


func set_difficulty(diff: String) -> void:
	difficulty = diff

func get_difficulty() -> String:
	return difficulty

func get_highscores() -> Array:
	if difficulty == "normal":
		return highscores_normal
	elif difficulty == "hard":
		return highscores_hard
	return []

func save_to_file(name: String, minutes: int, seconds: int, msec: int) -> void:
	var new_score: Dictionary = {
		"name": player_name,
		"minutes": minutes,
		"seconds": seconds,
		"msec": msec
	}
	
	var current_highscores = get_highscores()
	current_highscores.append(new_score)
	
	current_highscores.sort_custom(_compare_scores)
	
	if current_highscores.size() > 10:
		current_highscores.pop_back()

	var file_path = "user://highscore_%s.json" % difficulty
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(current_highscores))
	file.close()
	


func get_top_score(difficulty: String) -> Dictionary:
	var highscores = []
	if difficulty == "normal":
		highscores = highscores_normal
	elif difficulty == "hard":
		highscores = highscores_hard

	if highscores.size() > 0:
		return highscores[0]  # Der beste Score ist der erste Eintrag in der sortierten Liste
	return {} # Keine Highscores vorhanden


	
func load_from_file() -> void:
	var file_path = "user://highscore_%s.json" % difficulty
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var data = file.get_as_text()
		if data != "":
			var current_highscores = JSON.parse_string(data)
			if typeof(current_highscores) != TYPE_ARRAY:
				current_highscores = []  # Fallback, falls die Daten keine gültige Liste sind
			else:
				current_highscores.sort_custom(_compare_scores)
				print(current_highscores)
			
			if difficulty == "normal":
				highscores_normal = current_highscores
			elif difficulty == "hard":
				highscores_hard = current_highscores
		file.close()
		
		

func load_from_file_for_difficulty(difficulty: String) -> void:
	var file_path = "user://highscore_%s.json" % difficulty
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var data = file.get_as_text()
		if data != "":
			var current_highscores = JSON.parse_string(data)
			if typeof(current_highscores) != TYPE_ARRAY:
				current_highscores = []  # Fallback, falls die Daten keine gültige Liste sind
			else:
				current_highscores.sort_custom(_compare_scores)
				print(current_highscores)
			
			if difficulty == "normal":
				highscores_normal = current_highscores
			elif difficulty == "hard":
				highscores_hard = current_highscores
		file.close()
		
		

		
func _compare_scores(a: Dictionary, b: Dictionary) -> int:
	# Vergleichsfunktion zum Sortieren der Highscores
	var time_a = a["minutes"] * 60000 + a["seconds"] * 1000 + a["msec"]
	var time_b = b["minutes"] * 60000 + b["seconds"] * 1000 + b["msec"]
	
	if time_a < time_b:
		return true
	return false








