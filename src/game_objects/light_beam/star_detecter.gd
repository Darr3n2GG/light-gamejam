class_name StarDetecter

var collided_star : Star

func detect_star(collider : CollisionObject2D) -> void:
	var collider_parent = collider.get_parent()
	if collided_star != null and collider_parent is Star:
		if collided_star.light_enabled == false:
			collided_star = collider_parent
			collided_star.emit_light()
			
func hide_light_of_star() -> void:
	if collided_star != null:
		if collided_star.light_enabled:
			collided_star.hide_light()
			collided_star = null

		
	
