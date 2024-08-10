extends Control





func _on_normal_pressed() -> void:
	Globalstate.player_name = %LineEdit.text
	if Globalstate.player_name != "":
		Globalstate.set_difficulty("normal")
		get_tree().change_scene_to_file("res://Level/level_001.tscn")
	print(Globalstate.player_name)


func _on_hard_pressed() -> void:
	Globalstate.player_name = %LineEdit.text
	if Globalstate.player_name != "":
		Globalstate.set_difficulty("hard")
		get_tree().change_scene_to_file("res://Level/level_001.tscn")
	print(Globalstate.player_name)

