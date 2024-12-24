extends Node2D
class_name Light

@onready var light_beam = preload("res://src/test_objects/light/light_beam/light_beam.tscn")
@export var array_of_pointers : Array[Pointer]
var array_of_light_beams : Array[LightBeam]
var light_detected : bool


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for pointer in array_of_pointers:
		var light_beam_instance = light_beam.instantiate()
		light_beam_instance.visibility = false
		array_of_light_beams.append(light_beam_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func emit_light() -> void:
	var direction_of_pointer = get_direction_of_pointer()
	light_beam_instance.rotate(direction_of_pointer)
	
func emit_light_of_index(i : int) -> void:
	var direction_of_pointer = get_direction_of_pointer(i)
	light_beam_instance.rotate(direction_of_pointer)
	
func get_direction_of_pointer(i : int = 0) -> float:
	var position_of_pointer_i = array_of_pointers[i].position
	var direction : float = self.get_angle_to(position_of_pointer_i)
	return direction
	
func queue_free_light() -> void:
	light_beam_instance.queue_free()
