extends Node2D
class_name Star

@onready var light_beam = preload("res://src/test_objects/light_beam/light_beam.tscn")
@onready var pointer = $Pointer
var light_detected : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func emit_light() -> void:
	var new_light_beam : RayCast2D = light_beam.instantiate()
	var direction_of_pointer = get_direction_of_pointer()
	new_light_beam.rotate(direction_of_pointer)
	
func get_direction_of_pointer() -> float:
	var direction : float = self.get_angle_to(pointer.position)
	return direction
	
func free_light() -> void:
	pass
