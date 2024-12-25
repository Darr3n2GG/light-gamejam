extends Node2D
class_name Star

@onready var mouse_click_timer = $Timer
@onready var sprite = $Sprite
var drag_sprite = load("res://src/game_objects/star/star.png")
var angle_sprite = load("res://src/game_objects/star/star2.png")

var touching_mouse : bool = false
var holding_mouse : bool = false
enum ActionStates {
	DRAG,
	ANGLE
}
var action_state : ActionStates = ActionStates.DRAG

func _process(_delta) -> void:
	if holding_mouse:
		if action_state == ActionStates.DRAG:
			global_position = get_global_mouse_position()
		else:
			var angle_of_self_to_mouse = self.get_angle_to(get_global_mouse_position()) + 1.570796
			# 1.570796 is 90 degrees in radian
			rotate(angle_of_self_to_mouse)

func _input(event) -> void:
	if event.is_action_pressed("LeftClick"):
		if touching_mouse:
			mouse_click_timer.start()
		else:
			reset_state()
	elif event.is_action_released("LeftClick"):
		if mouse_click_timer.time_left > 0 and touching_mouse: #within time
			change_state()
		mouse_click_timer.stop()
		holding_mouse = false

func change_state() -> void:
	if action_state == ActionStates.DRAG: 
		action_state = ActionStates.ANGLE
		sprite.texture = angle_sprite
	else:
		action_state = ActionStates.DRAG
		sprite.texture = drag_sprite
		
func reset_state() -> void:
	action_state = ActionStates.DRAG
	sprite.texture = drag_sprite
			
func _on_timer_timeout() -> void:
	holding_mouse = true
		
func _on_area_2d_mouse_entered():
	touching_mouse = true

func _on_area_2d_mouse_exited():
	touching_mouse = false
