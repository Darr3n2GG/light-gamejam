class_name StarDetecter

var collided_star : Star

func detect_star(collider : CollisionObject2D) -> void:
	var collider_parent = collider.get_parent()
	if collider_parent is Star:
		if not collider_parent.light_enabled:
			collided_star = collider_parent
			collided_star.emit_light()
	elif collided_star != null and collider_parent != collided_star:
		if collided_star.light_enabled:
			collided_star.hide_light()
			collided_star = null

func hide_light_of_collided_star() -> void:
	if collided_star != null:
		collided_star.hide_light()
		collided_star = null

		
	
