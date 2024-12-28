extends Area2D
class_name WinCondition

signal light_entered

@onready var sprite = $Sprite2D
const dark_sprite = preload("res://src/game_objects/win_condition/window_dark.png")
const bright_sprite = preload("res://src/game_objects/win_condition/window_bright.png")

var light_has_entered : bool = false

func win() -> void:
	light_entered.emit()
	sprite.texture = bright_sprite
	$Timer.start()
	light_has_entered = true
		
func next_level() -> void:
	var current_scene_file = get_parent().scene_file_path
	var next_level_number = current_scene_file.left(1).to_int() + 1
	var next_level_name = "level_" + str(next_level_number)
	Utilities.switch_scene(next_level_name, get_parent())

func _on_timer_timeout() -> void:
	next_level()
