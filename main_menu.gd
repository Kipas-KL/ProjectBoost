extends Control





func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://GameMenu.tscn")


func _on_rules_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()



