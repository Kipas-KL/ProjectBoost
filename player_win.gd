extends Control


func _ready() -> void:
	%Name.text =  Globalstate.player_name
	%Minutes.text = "%02d:" % GlobalTimer.minutes
	%Seconds.text = "%02d." % GlobalTimer.seconds
	%Msecs.text = "%02d" % GlobalTimer.msec
	
	print(GlobalTimer.time)
	
	Globalstate.load_from_file()
	GlobalTimer.reset_timer()
	load_from_file()

func display_highscores():
	# Entfernen aller bisherigen Kinder des Containers
	for child in %LeaderboardContainer.get_children():
		%LeaderboardContainer.remove_child(child)
		child.queue_free()  # Löscht das Kind aus dem Speicher


	for i in range(min(Globalstate.highscores.size(), 10)):  # Zeige die Top 10 Highscores an
		var score = Globalstate.highscores[i]
		
		var name_label = Label.new()
		var minutes_label = Label.new()
		var seconds_label = Label.new()
		var msecs_label = Label.new()

		
		name_label.text = score ["name"]
		minutes_label.text = "%02d:" % score["minutes"]
		seconds_label.text = "%02d." % score["seconds"]
		msecs_label.text = "%02d" % score["msec"]

		var spacer = Control.new()
		spacer.size_flags_horizontal = Control.SIZE_EXPAND
		
		var entry_container = HBoxContainer.new()
		entry_container.add_child(name_label)
		entry_container.add_child(spacer)  # Abstandshalter hinzufügen	
		entry_container.add_child(minutes_label)
		entry_container.add_child(seconds_label)
		entry_container.add_child(msecs_label)
		
		entry_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		entry_container.alignment = BoxContainer.ALIGNMENT_CENTER
		
		%LeaderboardContainer.add_child(entry_container)

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






func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
