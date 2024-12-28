extends PointLight2D

@export var end_light: bool = false

func _ready(): #For last level
	if end_light:
		_on_win_condition_light_entered()

func _on_win_condition_light_entered() -> void:
	var tween = get_tree().create_tween()
	var gradient = texture.gradient
	var final_value = PackedFloat32Array([0, 1])
	tween.tween_property(gradient, "offsets", final_value, 1)
