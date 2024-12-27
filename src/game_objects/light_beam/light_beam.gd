extends Node2D
class_name LightBeam

@onready var raycast = $RayCast
@onready var sprite = $Sprite
@onready var end_point = $EndPoint

var light_beam_enabled : bool = false
var collided_star : Star

func _process(_delta: float) -> void:
	if raycast.is_colliding():
		end_point.global_position = raycast.get_collision_point()
		detect_star()
	else:
		end_point.global_position = raycast.target_position
	sprite.region_rect.end.x = end_point.global_position.length() * 1/sprite.scale.x
	
func detect_star() -> void:
	var collider = raycast.get_collider().get_parent()
	if check_collider_is_star_and_not_light_enabled():
		collided_star = collider
		emit_light_of_collided_star()
			
func check_collider_is_star_and_not_light_enabled() -> bool:
	var collider = raycast.get_collider().get_parent()
	if collider is Star:
		return not collider.light_enabled
	else:
		return false

func emit_light_of_collided_star() -> void:
	var collider = raycast.get_collider().get_parent()
	if collider == collided_star:
		collided_star.emit_light()
	else:
		collided_star.hide_light()
					
func enable_light_beam() -> void:
	light_beam_enabled = true
	self.show()
		
func disable_light_beam() -> void:
	light_beam_enabled = false
	self.target_position.y = 0
	self.hide()
