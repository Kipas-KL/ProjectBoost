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

