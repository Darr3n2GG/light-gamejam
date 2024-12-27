class_name StarDetecter

var collided_star : Star

func detect_star(collider : CollisionObject2D) -> void:
	var collider_parent = collider.get_parent()
	if collider_parent is Star and check_collided_star_light_enabled() == false:
		collided_star = collider_parent
		collided_star.emit_light()
		
func check_collided_star_light_enabled() -> bool:
	if collided_star == null:
		return false
	else:
		return collided_star.light_enabled
	
func hide_light_of_star() -> void:
	collided_star.hide_light()

		
	
