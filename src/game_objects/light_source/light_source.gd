extends Node2D
class_name LightSource

var selected: bool = false
var touching_mouse: bool = false

func _input(event): #check if clicked on moon at first
	if event.is_action_pressed("LeftClick") and touching_mouse:
		selected = true
	elif event.is_action_released("LeftClick"):
		selected = false

func _process(_delta):
	if selected: #only rotate when initial click on moon
		var angle_of_self_to_mouse = self.get_angle_to(get_global_mouse_position())
		rotate(angle_of_self_to_mouse)

##Check whether mouse inside moon
func _on_area_2d_mouse_entered():
	touching_mouse = true

func _on_area_2d_mouse_exited():
	touching_mouse = false
