class_name WinDetecter

func detect_win_condition(collider : CollisionObject2D) -> void:
	if collider is WinCondition:
		if collider.light_has_entered == false:
			collider.win()
