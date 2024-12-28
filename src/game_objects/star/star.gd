extends Node2D
class_name Star

@onready var mouse_click_timer = $Timer
@onready var sprite = $Sprite
@onready var light_emitter = $LightEmitter
@onready var debug = $Debug
@onready var area= $Area2D
var drag_sprite = preload("res://src/assets/star.png")
var rotate_sprite = preload("res://src/assets/star2.png")

var touching_mouse : bool = false
var holding_mouse : bool = false
var light_enabled : bool = false
enum ActionStates { DRAG, ROTATE }
var action_state : ActionStates = ActionStates.DRAG
var initial_position : Vector2 = Vector2()

signal release_mouse_after_hold

func _input(event) -> void:
	if event.is_action_pressed("LeftClick"):
		left_click_pressed()
	elif event.is_action_released("LeftClick"):
		left_click_released()
		
func left_click_pressed() -> void:
	if touching_mouse: #check whether click or hold
		mouse_click_timer.start()
	else: #back to drag mode
		reset_state()
		
func reset_state() -> void:
	action_state = ActionStates.DRAG
	sprite.texture = drag_sprite
			
func left_click_released() -> void: #define click
	var is_clicked = mouse_click_timer.time_left > 0
	if is_clicked and touching_mouse:
		change_state()
	if holding_mouse:
		release_mouse_after_hold.emit()
	mouse_click_timer.stop()
	holding_mouse = false
	
func change_state() -> void:
	if action_state == ActionStates.DRAG: 
		action_state = ActionStates.ROTATE
		sprite.texture = rotate_sprite
	else:
		action_state = ActionStates.DRAG
		sprite.texture = drag_sprite
		
func _on_timer_timeout() -> void: #define hold
	holding_mouse = true
		
func _on_area_2d_mouse_entered() -> void:
	touching_mouse = true

func _on_area_2d_mouse_exited() -> void:
	touching_mouse = false

func _process(_delta) -> void:
	debug.text = "light_enabled : " + str(light_enabled)
	if holding_mouse:
		execute_action()

func execute_action() -> void:
	set_initial_position(global_position)
	if action_state == ActionStates.DRAG:
		global_position = get_global_mouse_position()
	else:
		var angle_of_self_to_mouse = self.get_angle_to(get_global_mouse_position()) + 1.570796
		# 1.570796 is 90 degrees in radian
		rotate(angle_of_self_to_mouse)
		
func set_initial_position(value :  Vector2) -> void:
	if initial_position == Vector2():
		initial_position = value
		
func _on_release_mouse_after_hold() -> void:
	check_action_valid()
	
func check_action_valid() -> void:
	if area.has_overlapping_areas():
		global_position = initial_position	
		
func emit_light() -> void:
	light_emitter.emit_light()
	light_enabled = true
	
func hide_light() -> void:
	light_emitter.hide_light()
	light_enabled = false
	
