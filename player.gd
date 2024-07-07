extends RigidBody3D

## How much vertical force to apply when moving.
@export_range(750.0, 2500.0) var thrust: float = 1000.0
## How fast rotate the object.
@export var torque_thrust: float = 100.0

var is_transitioning: bool = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * thrust)
		%BoosterParticles.emitting = true
		if %RocketAudio.playing == false:
			%RocketAudio.play()
	else: 
		%BoosterParticles.emitting = false 
		%RocketAudio.stop()
			
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0, 0.0, torque_thrust * delta))
		%RightBoosterParticles.emitting = true
	else:
		%RightBoosterParticles.emitting = false
		
	if Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0, 0.0, -torque_thrust * delta))
		%LeftBoosterParticles.emitting = true
	else:
		%LeftBoosterParticles.emitting = false


func _on_body_entered(body: Node) -> void:
	if is_transitioning == false:
		if "Goal" in body.get_groups():
			complete_level(body.file_path)
			
		if "Hazard" in body.get_groups():
			crash_sequence()
		
func crash_sequence() -> void:
	print("Kaboom!")
	%ExplosionAudio.play()
	%BoosterParticles.emitting = false
	%RightBoosterParticles.emitting = false
	%LeftBoosterParticles.emitting = false
	%ExplosionParticles.emitting = true
	%RocketAudio.stop()
	set_process(false)
	is_transitioning = true
	var tween = create_tween()
	tween.tween_interval(2.5)
	tween.tween_callback(get_tree().reload_current_scene)
	
func complete_level(next_level_file: String) -> void:
	print("Level Complete")
	%SuccessAudio.play()
	%BoosterParticles.emitting = false
	%RightBoosterParticles.emitting = false
	%LeftBoosterParticles.emitting = false
	%SuccessParticles.emitting = true
	%RocketAudio.stop()
	set_process(false)
	is_transitioning = true
	var tween = create_tween()
	tween.tween_interval(2.5)
	tween.tween_callback(
		get_tree().change_scene_to_file.bind(next_level_file)
	)
		
		
		
		
		
		
		
		
		
