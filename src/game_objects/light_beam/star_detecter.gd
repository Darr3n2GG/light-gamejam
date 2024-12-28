class_name StarDetecter

var collided_star : Star = null
var has_collided : bool = false

func detect_star(collider : CollisionObject2D) -> void:
	var collider_parent = collider.get_parent()
	if collided_star == null:
		if collider_parent is Star:
			if not collider_parent.light_enabled:
				collided_star = collider_parent
				collided_star.emit_light()
	elif collider_parent != collided_star:
		hide_light()
		
func hide_light_of_collided_star() -> void:
	if collided_star != null:
		hide_light()

func hide_light() -> void:
	if collided_star.light_enabled:
		collided_star.hide_light()
		collided_star = null

		
	
