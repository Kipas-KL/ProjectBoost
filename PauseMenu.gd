extends Control

func _ready() -> void:
	%SettingsMenu.hide()

var _is_paused:bool = false:
	set = set_paused

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_is_paused = !_is_paused

func set_paused(value:bool) -> void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused


func _on_resume_btn_pressed() -> void:
	_is_paused = false


func _on_settings_btn_pressed() -> void:
	%SettingsMenu.show()
	


func _on_restart_btn_3_pressed() -> void:
	_is_paused = false
	get_tree().reload_current_scene()


func _on_quit_btn_pressed() -> void:
	_is_paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
	GlobalTimer.reset_timer()
	BnMusic.stop_music()




func _on_back_btn_pressed() -> void:
	%SettingsMenu.hide()
