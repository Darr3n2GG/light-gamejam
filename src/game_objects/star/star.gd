extends Node2D
class_name Star

@onready var timer = $Timer
var drag_mode: bool = true #drag mode on default
var touching_mouse: bool = false
var holding: bool = false

func _process(delta):
	if holding:
		if drag_mode:
			global_position = get_global_mouse_position()
		else:
			look_at(get_global_mouse_position()) ## problem: it can't be paused with releasing left click

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT: 
			if event.is_pressed() and touching_mouse: #to define hold
				holding = true
				timer.start()
			if !event.is_pressed():
				if timer.time_left != 0: #within time
					clicked()
				timer.stop()
				holding = false
				print("not holding")

func clicked():
	if touching_mouse: #inside star
		if drag_mode: 
			drag_mode = false
			print("angle")
		else:
			drag_mode = true
			print("drag")

func _on_area_2d_mouse_entered():
	touching_mouse = true

func _on_area_2d_mouse_exited():
	touching_mouse = false
