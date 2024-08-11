extends Node

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0

func add_time(delta):
	time += delta
	msec = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	
	#print(time)
	
func reset_timer():
	time = 0.0
	minutes = 0
	seconds = 0
	msec = 0
