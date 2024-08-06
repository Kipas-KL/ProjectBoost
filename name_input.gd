extends Control


var player_name = ""


func _on_button_pressed() -> void:
	player_name = $VBoxContainer/LineEdit.text
	if player_name != "":
		Globalstate.set_difficulty("normal")
		get_tree().change_scene_to_file("res://Level/level_001.tscn")  # Change this to your main game scene path
