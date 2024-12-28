extends RayCast2D
class_name LightBeam

var star_detecter = StarDetecter.new()
var win_detecter = WinDetecter.new()

func _process(_delta: float) -> void:
	var cast_point = target_position.x
	if self.is_colliding():
		cast_point = (get_collision_point() - global_position).length()
		var collider = get_collider()
		star_detecter.detect_star(collider)
		win_detecter.detect_win_condition(collider)
	$Line2D.points[1].x = cast_point
	
func enable_light_beam() -> void:
	self.enabled = true
	self.show()
		
func disable_light_beam() -> void:
	star_detecter.hide_light_of_collided_star()
	self.enabled = false
	self.hide()
