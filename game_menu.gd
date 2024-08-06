extends Control


var player_name = ""


func _on_normal_pressed() -> void:
	player_name = %LineEdit.text
	if player_name != "":
		Globalstate.set_difficulty("normal")
		get_tree().change_scene_to_file("res://Level/level_001.tscn")



func _on_hard_pressed() -> void:
	player_name = %LineEdit.text
	if player_name != "":
		Globalstate.set_difficulty("hard")
		get_tree().change_scene_to_file("res://Level/level_001.tscn")


