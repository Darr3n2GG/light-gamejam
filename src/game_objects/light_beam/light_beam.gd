extends Node2D
class_name LightBeam

@onready var raycast = $RayCast
@onready var sprite = $Sprite
@onready var end_point = $EndPoint
var star_detecter = StarDetecter.new()

var light_beam_enabled : bool = false

func _process(_delta: float) -> void:
	if raycast.is_colliding():
		end_point.global_position = raycast.get_collision_point()
		var collider = raycast.get_collider()
		star_detecter.detect_star(collider)
	else:
		end_point.global_position = raycast.target_position
		if star_detecter.check_collided_star_light_enabled():
			star_detecter.hide_light_of_star()
	sprite.region_rect.end.x = end_point.global_position.length() * 1/sprite.scale.x
					
func enable_light_beam() -> void:
	light_beam_enabled = true
	self.show()
		
func disable_light_beam() -> void:
	light_beam_enabled = false
	raycast.target_position.y = 0
	self.hide()
