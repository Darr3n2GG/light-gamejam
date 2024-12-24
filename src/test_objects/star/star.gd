extends Node2D
class_name Star

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	pass
	
func get_direction_of_pointer() -> float:
	var direction : float = self.get_angle_to(pointer.position)
	return direction
	
func queue_free_light() -> void:
	light_beam_instance.queue_free()
