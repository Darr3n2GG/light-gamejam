extends GutTest

class TestSprite:
	extends GutTest
	
	var star = preload("res://src/test_objects/star/star.tscn").instantiate()
	var sprite = star.get_node("Sprite")
	
	func after_all():
		star.queue_free()
		gut.p("Freed star orphan")
	
	func test_sprite_exists() -> void:
		assert_not_null(sprite, "Sprite does not exist.")
		
	func test_sprite_texture_exists() -> void:
		var texture = sprite.texture
		assert_not_null(texture, "Texture does not exist.")
		
	func test_sprite_centered() -> void:
		var centered = sprite.centered
		assert_true(centered, "Sprite is not centered.")
		
	func test_sprite_not_offset() -> void:
		var offset = sprite.offset
		assert_eq(offset, Vector2.ZERO, "Sprite has an offset.")
		
	func test_sprite_region_not_enabled() -> void:
		var region = sprite.region_enabled
		assert_false(region, "Sprite has region enabled.")
		
var star = preload("res://src/test_objects/star/star.tscn").instantiate()

func after_all():
	star.queue_free()
	gut.p("Freed orphans.")
	
func test_pointer_exists() -> void:
	var pointer = star.get_node("Pointer")
	assert_not_null(pointer, "Pointer does not exist.")
			
func test_star_selected() -> void:
	pending()
	
func test_star_deselected() -> void:
	pending()
	
func test_star_state_changed() -> void:
	pending()
	
func test_star_detect_light() -> void:
	pending()

func test_star_emit_light() -> void:
	pending()
	
func test_star_draggable() -> void:
	pending()
	
func test_star_rotatable() -> void:
	pending()
	
	
