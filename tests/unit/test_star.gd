extends GutTest

class TestSprite:
	extends GutTest
	
	var star = preload("res://src/game_objects/star/star.tscn").instantiate()
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
		
var star = preload("res://src/game_objects/star/star.tscn").instantiate()

func after_all():
	star.queue_free()
	gut.p("Freed orphans.")
	
func test_star_state_changed() -> void:
	#var expected = star.ActionStates.ANGLE
	#star.change_state()
	#var got = star.action_state
	#assert_eq(got, expected, "Star failed to change state.")
	pending()
	
func test_star_draggable() -> void:
	#star.reset_state()
	#var sender = InputSender.new(star)
	#sender.left_mouse_down
	pending()
	
func test_star_rotatable() -> void:
	pending()
