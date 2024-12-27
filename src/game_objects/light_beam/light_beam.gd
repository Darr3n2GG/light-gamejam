extends RayCast2D
class_name LightBeam

@onready var sprite = $Sprite
@onready var end_point = $EndPoint
var star_detecter = StarDetecter.new()

var light_beam_enabled : bool = false

func _process(_delta: float) -> void:
	var cast_point = target_position
	
	if self.is_colliding():
		cast_point = get_collision_point()
		var collider = get_collider()
		print("colliding point: " + str(cast_point) + " , collider pos: " + str(collider.global_position))
		star_detecter.detect_star(collider)
	else:
		if star_detecter.check_collided_star_light_enabled():
			star_detecter.hide_light_of_star()
	#sprite.region_rect.end.x = end_point.position.length()
	$Line2D.set_point_position(1, cast_point)
	
func enable_light_beam() -> void:
	light_beam_enabled = true
	self.enabled = true
	self.show()
		
func disable_light_beam() -> void:
	light_beam_enabled = false
	self.target_position.y = 0
	self.enabled = false
	self.hide()
