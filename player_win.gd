extends Control

#var gameSave = SaveGame.new()
#var save_path = "user://scoresave.tres"
#
#@export var score_panel_scene: PackedScene

func _ready() -> void:
	%Name.text =  Globalstate.player_name
	%Minutes.text = "%02d:" % GlobalTimer.minutes
	%Seconds.text = "%02d." % GlobalTimer.seconds
	%Msecs.text = "%02d" % GlobalTimer.msec
	
	#Globalstate.save_to_file(name, Globalstate.minutes, Globalstate.secondes, Globalstate.msec)
	Globalstate.load_from_file()
	GlobalTimer.reset_timer()
	load_from_file()

func display_highscores():
	#var highscore_ui_elements = {
		#"name": $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/PlayerLabel,  # Verweise auf die Label-Nodes
		#"minutes": $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/PlayerLabel,
		#"seconds": $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/SecondsLabel,
		#"msec": $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/MsecLabel
	#}
	#
	#for i in range(min(Globalstate.highscores.size(), 10)):  # Zeige die Top 10 Highscores an
		#var score = Globalstate.highscores[i]
		#highscore_ui_elements["name"].text = "%s" % score["name"]
		#highscore_ui_elements["minutes"].text = "%02d:" % score["minutes"]
		#highscore_ui_elements["seconds"].text = "%02d." % score["seconds"]
		#highscore_ui_elements["msec"].text = "%02d" % score["msec"]

		# Update UI for the next score if you have multiple labels per row, 
		# or iterate through a list of UI nodes dynamically.
		
	for i in range(min(Globalstate.highscores.size(), 10)):  # Zeige die Top 10 Highscores an
		var score = Globalstate.highscores[i]
		var name_label = $"MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer{i+1}/PlayerLabel"
		var minutes_label = $"MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer{i+1}/MinutesLabel"
		var seconds_label = $"MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer{i+1}/SecondsLabel"
		var msecs_label = $"MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer{i+1}/MsecLabel"
		
		name_label.text = score["name"]
		minutes_label.text = "%02d:" % score["minutes"]
		seconds_label.text = "%02d." % score["seconds"]
		msecs_label.text = "%02d" % score["msec"]

func load_from_file() -> void:
	var file = FileAccess.open("user://highscore.json", FileAccess.READ)
	if file:
		var data = file.get_as_text()
		if data != "":
			Globalstate.highscores = JSON.parse_string(data)
			if typeof(Globalstate.highscores) != TYPE_ARRAY:
				Globalstate.highscores = []  # Fallback, falls die Daten keine gültige Liste sind
		file.close()
	display_highscores()  # Aktualisiere die Anzeige nach dem Laden




#Kein Plan was das genau ist 
#func update_highscores(player_name): 
	#var name = Globalstate.player_name
	#var score = GlobalTimer.time
	#var highscores = Globalstate.highscores
	#highscores[name] = score
	#while highscores.size() > 10:
		#var lowest_value: int = 100
		#for entry in highscores:
			#if highscores[entry] < lowest_value:
				#lowest_value = highscores[entry]
			#
		#for logged in highscores:
			#if highscores[logged] == lowest_value:
				#highscores.erase(logged)
#
#func order_highscores(score: Dictionary) -> Dictionary:
	#var original_dict: Dictionary = Globalstate.highscores.duplicate()
	#var ordered_dict: Dictionary
	#for i in original_dict.size():
		#var highest_score: int = 0
		#for entry in original_dict:
			#if original_dict[entry] > highest_score:
				#highest_score = original_dict[entry]
			#ordered_dict[original_dict.find_key(highest_score)] = highest_score
			#original_dict.erase(original_dict.find_key(highest_score))
	#return ordered_dict
#
#func save_game():
	#ResourceSaver.save(gameSave, save_path)
#
#func load_save():
	#if FileAccess.file_exists(save_path):
		#gameSave = ResourceLoader.load(save_path + name).duplicate(true)
		#Globalstate.highscores = gameSave.highscores
	#else:
		#printerr('No save file found at path')
#
#
#func draw_highscores_to_ui(highscores):
	#for i in %VBoxContainer.get_child_count():
		#if get_child(i) != null:
			#%VBoxContainer.get_child(i).queue_free()
	#
	#for entry in highscores:
		#var score_panel = score_panel_scene.instantiate()
		#score_panel.get_child(0).text = entry
		#score_panel.get_child(1).text = str(highscores[entry]).pad_zeros(3)
		#%VBoxContainer.add_child(score_panel)



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
