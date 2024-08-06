extends Control

func _ready() -> void:
	%Minutes.text = "%02d:" % GlobalTimer.minutes
	%Seconds.text = "%02d." % GlobalTimer.seconds
	%Msecs.text = "%02d" % GlobalTimer.msec
