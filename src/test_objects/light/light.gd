extends Node2D
class_name Light

@onready var light_beam = preload("res://src/test_objects/light/light_beam/light_beam.tscn")
var number_of_pointers : int
var array_of_light_beams : Array[LightBeam]
var light_detected : bool
var pointer_to_light_beam_dictionary : Dictionary = {}


func _ready() -> void:
	var pointers = get_children()
	if not is_instance_of(pointers, Array[Pointer]):
		push_error("One or more children is not a pointer")
	number_of_pointers = get_child_count()
	
	for pointer in pointers:
		add_light_beam()
		map_pointer_to_light_beam(pointer)
		
func add_light_beam() -> void:
	var light_beam_instance = light_beam.instantiate()
	light_beam_instance.hide()
	add_child(light_beam_instance)
	
func map_pointer_to_light_beam(pointer : Pointer) -> void:
	var light_beam_index = number_of_pointers + pointer_to_light_beam_dictionary.size()
	var light_beam = get_child(light_beam_index)
	pointer_to_light_beam_dictionary[pointer] = light_beam

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func emit_light() -> void:
	for light_beam in array_of_light_beams:
		emit_light_of_child(light_beam)
	
func emit_light_of_child(light_beam : LightBeam) -> void:
	light_beam.show()
	var direction_of_pointer = get_direction_of_pointer(i)
	light_beam.rotate(direction_of_pointer)
	
func get_direction_of_pointer(i : int = 0) -> float:
	var position_of_pointer_i = array_of_pointers[i].position
	var direction : float = self.get_angle_to(position_of_pointer_i)
	return direction
	
func queue_free_light() -> void:
	light_beam_instance.queue_free()
