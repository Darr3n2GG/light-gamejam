extends Node2D
class_name Star

@onready var mouse_click_timer = $Timer
@onready var sprite = $Sprite
@onready var light_emitter = $LightEmitter
var drag_sprite = preload("res://src/assets/star.png")
var angle_sprite = preload("res://src/assets/star2.png")

var touching_mouse : bool = false
var holding_mouse : bool = false
var light_enabled : bool = false
enum ActionStates { DRAG, ANGLE }
var action_state : ActionStates = ActionStates.DRAG

func _input(event) -> void:
	if event.is_action_pressed("LeftClick"):
		left_click_pressed()
	elif event.is_action_released("LeftClick"):
		left_click_released()
		
func left_click_pressed() -> void:
	if touching_mouse:
		mouse_click_timer.start()
	else:
		reset_state()
		
func reset_state() -> void:
	action_state = ActionStates.DRAG
	sprite.texture = drag_sprite
			
func left_click_released() -> void:
	var is_clicked = mouse_click_timer.time_left > 0
	if is_clicked and touching_mouse:
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
		
func _on_timer_timeout() -> void:
	holding_mouse = true
		
func _on_area_2d_mouse_entered() -> void:
	touching_mouse = true

func _on_area_2d_mouse_exited() -> void:
	touching_mouse = false

func _process(_delta) -> void:
	if holding_mouse:
		execute_action()
			
func execute_action() -> void:
	if action_state == ActionStates.DRAG:
		global_position = get_global_mouse_position()
	else:
		var angle_of_self_to_mouse = self.get_angle_to(get_global_mouse_position()) + 1.570796
		# 1.570796 is 90 degrees in radian
		rotate(angle_of_self_to_mouse)
		
func emit_light() -> void:
	light_emitter.emit_light()
	light_enabled = true
	
func hide_light() -> void:
	light_emitter.hide_light()
	light_enabled = false
	
			
