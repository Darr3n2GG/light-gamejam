extends PointLight2D

func _on_win_condition_light_entered() -> void:
	var tween = get_tree().create_tween()
	var gradient = texture.gradient
	var final_value = PackedFloat32Array([0, 1])
	tween.tween_property(gradient, "offsets", final_value, 1)
