extends Node2D
class_name LightBeam

@onready var raycast = $RayCast
@onready var sprite = $Sprite
@onready var end_point = $EndPoint

var light_beam_enabled : bool = false

func _process(_delta: float) -> void:
	if raycast.is_colliding():
		end_point.global_position = raycast.get_collision_point()
	else:
		end_point.global_position = raycast.target_position
	sprite.region_rect.end.x = end_point.global_position.length() * 4
			
func enable_light_beam() -> void:
	light_beam_enabled = true
	self.show()
		
func disable_light_beam() -> void:
	light_beam_enabled = false
	self.target_position.y = 0
	self.hide()
