extends Control


func _on_normal_pressed() -> void:
	Globalstate.set_difficulty("normal")
	get_tree().change_scene_to_file("res://Level/level_001.tscn")





func _on_hard_pressed() -> void:
	Globalstate.set_difficulty("hard")
	get_tree().change_scene_to_file("res://Level/level_001.tscn")
