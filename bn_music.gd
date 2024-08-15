extends AudioStreamPlayer

@onready var audio_stream_player: AudioStreamPlayer = $"."

func play_music() -> void:
	audio_stream_player.play()

func stop_music() -> void:
	audio_stream_player.stop()
