extends Node2D
class_name LightEmitter

@onready var light_beam_resource : Resource = preload("res://src/game_objects/light_beam/light_beam.tscn")
@export var exceptions : Array[CollisionObject2D]

var number_of_pointers : int
var pointer_to_light_beam_dictionary : Dictionary = {}


func _ready() -> void:
	set_process(false)
	check_children_are_pointers()
	number_of_pointers = get_child_count()
	setup()
		
func check_children_are_pointers() -> void:
	var pointers = get_children()
	for pointer in pointers:
		if pointer is not Pointer:
			push_error("Children " + pointer.name + " is not a pointer.")
			
func setup() -> void:
	var pointers = get_children()
	for pointer in pointers:
		add_light_beam()
		map_pointer_to_light_beam(pointer)
		
func add_light_beam() -> void:
	var light_beam_instance = light_beam_resource.instantiate()
	light_beam_instance.hide()
	if exceptions:
		add_exception_to_light_beam(light_beam_instance)
	add_child(light_beam_instance)
	
func add_exception_to_light_beam(instance : LightBeam):
	for exception in exceptions:
		instance.get_child(0).add_exception(exception)
	
func map_pointer_to_light_beam(pointer : Pointer) -> void:
	var light_beam_index = number_of_pointers + pointer_to_light_beam_dictionary.size()
	var light_beam = get_child(light_beam_index)
	pointer_to_light_beam_dictionary[pointer] = light_beam

func _process(_delta: float) -> void:
	tick_light_beam()

func tick_light_beam() -> void:
	for pointer in pointer_to_light_beam_dictionary:
		var direction : float = self.get_angle_to(pointer.position)
		var light_beam = pointer_to_light_beam_dictionary[pointer]
		light_beam.rotate(direction)

func emit_light() -> void:
	for pointer in pointer_to_light_beam_dictionary:
		var light_beam = pointer_to_light_beam_dictionary[pointer]
		light_beam.enable_light_beam()
	set_process(true)
	
func hide_light() -> void:
	for pointer in pointer_to_light_beam_dictionary:
		var light_beam = pointer_to_light_beam_dictionary[pointer]
		light_beam.disable_light_beam()
	set_process(false)
