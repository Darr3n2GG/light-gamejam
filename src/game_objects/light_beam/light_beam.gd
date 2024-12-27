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
		if check_collided_star_light_enabled():
			collided_star.hide_light()
	sprite.region_rect.end.x = end_point.global_position.length() * 1/sprite.scale.x

func check_collided_star_light_enabled() -> bool:
	if collided_star == null:
		return false
	else:
		return collided_star.light_enabled

func detect_star() -> void:
	var collider = raycast.get_collider().get_parent()
	if collider is Star and check_collided_star_light_enabled() == false:
		collided_star = collider
		collided_star.emit_light()
		
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
	raycast.target_position.y = 0
	self.hide()
