extends Node2D
class_name Light

@onready var light_beam_resource : Resource = preload("res://src/game_objects/light/light_beam/light_beam.tscn")
var number_of_pointers : int
var light_detected : bool = false
var pointer_to_light_beam_dictionary : Dictionary = {}


func _ready() -> void:
	var pointers = get_children()
	for pointer in pointers:
		if pointer is not Pointer:
			push_error("Children " + pointer.name + " is not a pointer.")
	number_of_pointers = get_child_count()
	
	for pointer in pointers:
		add_light_beam()
		map_pointer_to_light_beam(pointer)
		
func add_light_beam() -> void:
	var light_beam_instance = light_beam_resource.instantiate()
	light_beam_instance.hide()
	add_child(light_beam_instance)
	
func map_pointer_to_light_beam(pointer : Pointer) -> void:
	var light_beam_index = number_of_pointers + pointer_to_light_beam_dictionary.size()
	var light_beam = get_child(light_beam_index)
	pointer_to_light_beam_dictionary[pointer] = light_beam

func _process(_delta: float) -> void:
	if light_detected:
		tick_light_beam()

func tick_light_beam() -> void:
	for pointer in pointer_to_light_beam_dictionary:
		var direction : float = self.get_angle_to(pointer)
		var light_beam = pointer_to_light_beam_dictionary[pointer]
		light_beam.rotate(direction)

func emit_light() -> void:
	for pointer in pointer_to_light_beam_dictionary:
		var light_beam = pointer_to_light_beam_dictionary[pointer]
		light_beam.show()
	light_detected = true
	
func hide_light() -> void:
	for pointer in pointer_to_light_beam_dictionary:
		var light_beam = pointer_to_light_beam_dictionary[pointer]
		light_beam.hide()
	light_detected = false
