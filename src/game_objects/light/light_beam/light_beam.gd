extends RayCast2D
class_name LightBeam

var light_beam_enabled : bool = false

func _process(_delta: float) -> void:
	if not is_colliding():
		self.target_position.y += 1
		
func enable_light_beam() -> void:
	light_beam_enabled = true
	self.show()
		
func disable_light_beam() -> void:
	light_beam_enabled = false
	self.target_position.y = 0
	self.hide()
