extends RayCast2D
class_name LightBeam

var star_detecter = StarDetecter.new()

var light_beam_enabled : bool = false

func _process(_delta: float) -> void:
	var cast_point = target_position.x
	if self.is_colliding():
		cast_point = get_collision_point().length()
		var collider = get_collider()
		star_detecter.detect_star(collider)
	else:
		star_detecter.hide_light_of_star()
	$Line2D.points[1].x = cast_point
	
func enable_light_beam() -> void:
	light_beam_enabled = true
	self.enabled = true
	self.show()
		
func disable_light_beam() -> void:
	light_beam_enabled = false
	self.target_position.y = 0
	self.enabled = false
	self.hide()
