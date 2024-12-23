extends GutTest

class TestSprite:
	extends GutTest
	
	var star = preload("res://src/test_objects/star/star.tscn").instantiate()
	
	func test_sprite_exists() -> void:
		var sprite = autoqfree(star.get_node("Sprite"))
		assert_not_null(sprite, "Sprite exists.")
		
	func test_sprite_texture_exists() -> void:
		pending()
		
	func test_sprite_not_centered() -> void:
		pending()
		
	func test_sprite_not_offset() -> void:
		pending()
		
	func test_sprite_region_not_enabled() -> void:
		pending()
			
func test_pointer_exists() -> void:
	pending()
	
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
	
	
