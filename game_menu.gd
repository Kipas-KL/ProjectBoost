extends Control




func _ready() -> void:
	# Laden der Highscores für beide Schwierigkeitsgrade
	Globalstate.load_from_file_for_difficulty("normal")
	Globalstate.load_from_file_for_difficulty("hard")
	
	# Zeigen Sie die Top-Highscores an
	display_top_highscores()


func display_top_highscores() -> void:
	# Zeige den besten Score für "normal"
	var top_easy_score = Globalstate.get_top_score("normal")
	if top_easy_score.size() > 0:
		%easy_name.text = top_easy_score["name"]
		%top_score_easy_label.text = "%02d:%02d.%02d" % [top_easy_score["minutes"], top_easy_score["seconds"], top_easy_score["msec"]]
	else:
		%easy_name.text = "----"
		%top_score_easy_label.text = "--:--.--"

	# Zeige den besten Score für "hard"
	var top_hard_score = Globalstate.get_top_score("hard")
	if top_hard_score.size() > 0:
		%hard_name.text = top_hard_score["name"]
		%top_score_hard_label.text = "%02d:%02d.%02d" % [top_hard_score["minutes"], top_hard_score["seconds"], top_hard_score["msec"]]
	else:
		%hard_name.text = "----"
		%top_score_hard_label.text = "--:--.--"


func display_score(score: Dictionary) -> void:
	var top_easy_score = Globalstate.get_top_score("normal")
	var top_hard_score = Globalstate.get_top_score("hard")
	%easy_name.text = top_easy_score ["name"]
	%top_score_easy_label.text = "%02d:%02d.%02d" % [top_easy_score["minutes"], top_easy_score["seconds"], top_easy_score["msec"]]
	
	
	%hard_name.text = score ["name"]
	%top_score_hard_label.text = "%02d:%02d.%02d" % [score["minutes"], score["seconds"], score["msec"]]

func display_empty_score() -> void:
	%easy_name.text = "----"
	%top_score_easy_label.text = "--:--.--"

	%hard_name.text = "----"
	%top_score_hard_label.text = "--:--.--"

func _on_normal_pressed() -> void:
	
	
	var player_name = %LineEdit.text.to_lower()# Wandelt den Text in Kleinbuchstaben um
	Globalstate.player_name = player_name
	
	# Optional: Falls nur bestimmte Buchstaben erlaubt sein sollen:
	var allowed_chars = "abcdefghijklmnopqrstuvwxyz"  # Beispiel für erlaubte Buchstaben
	var filtered_name = ""
	for char in player_name:
		if char in allowed_chars:
			filtered_name += char
	Globalstate.player_name = filtered_name
	
	
	
	
	#Globalstate.player_name = %LineEdit.text
	if Globalstate.player_name != "":
		Globalstate.set_difficulty("normal")
		get_tree().change_scene_to_file("res://Level/level_001.tscn")
		BnMusic.play_music()
	print(Globalstate.player_name)


func _on_hard_pressed() -> void:
	Globalstate.player_name = %LineEdit.text
	if Globalstate.player_name != "":
		Globalstate.set_difficulty("hard")
		get_tree().change_scene_to_file("res://Level/level_001.tscn")
		BnMusic.play_music()
	print(Globalstate.player_name)




func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_highscores_button_pressed() -> void:
	if %highscores_small.visible:
		%highscores_small.hide()
	else:
		%highscores_small.show()
	
