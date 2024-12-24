extends CharacterBody2D

var drag_mode: bool = true

func _unhandled_input(event):
	if event.pressed:
		# a function defining hold is needed
		#switch mode
		if drag_mode: 
			drag_mode = false
		else:
			drag_mode = true
