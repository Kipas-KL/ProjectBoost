extends Control


func _ready() -> void:
	BnMusic.stop_music()
	
	# Setze das Textlabel basierend auf dem Schwierigkeitsgrad
	var difficulty = Globalstate.get_difficulty()
	if difficulty == "normal":
		%diff_label.text = "highscores: easy ride"
	elif difficulty == "hard":
		%diff_label.text = "highscores: adventure"
	
	
	
	
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
	
	var highscores = Globalstate.get_highscores()

	for i in range(10):  # Zeige die Top 10 Highscores an
		var score = {}
		if i < highscores.size():
			score = highscores[i]
		else:
			score = {
				"name": "----",
				"minutes": "00",
				"seconds": "00",
				"msec": "00"
			}
		
		var rank_label = Label.new()
		var name_label = Label.new()
		var minutes_label = Label.new()
		var seconds_label = Label.new()
		var msecs_label = Label.new()

		rank_label.text = "%0d." % (i + 1)  # Der Rang beginnt bei 1
		name_label.text = score ["name"]
		if score["name"] == "----":
			minutes_label.text = "--:"
			seconds_label.text = "--."
			msecs_label.text = "--"
		else:
			minutes_label.text = "%02d:" % score["minutes"]
			seconds_label.text = "%02d." % score["seconds"]
			msecs_label.text = "%02d" % score["msec"]

		var spacer = Control.new()
		spacer.size_flags_horizontal = Control.SIZE_EXPAND
		
		var entry_container = HBoxContainer.new()
		entry_container.add_child(rank_label)
		entry_container.add_child(name_label)
		entry_container.add_child(spacer)  # Abstandshalter hinzufügen	
		entry_container.add_child(minutes_label)
		entry_container.add_child(seconds_label)
		entry_container.add_child(msecs_label)
		
		entry_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		entry_container.alignment = BoxContainer.ALIGNMENT_CENTER
		
		%LeaderboardContainer.add_child(entry_container)

func load_from_file() -> void:
	Globalstate.load_from_file()
	display_highscores()  # Aktualisiere die Anzeige nach dem Laden






func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://GameMenu.tscn")
