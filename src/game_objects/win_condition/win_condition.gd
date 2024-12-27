extends Node2D


func light_entered():
	pass

func win() -> void: #switch scene using code in Utilities
	var current_scene_file = get_parent().scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
	var next_level_name = "level_" + str(next_level_number)
	Utilities.switch_scene(next_level_name, get_parent())
