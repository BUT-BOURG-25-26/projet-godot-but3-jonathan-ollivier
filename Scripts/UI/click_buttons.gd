extends Control
class_name ClickButtons

func _ready():
	var is_mobile := OS.has_feature("mobile")
	if not is_mobile:
		hide()

func create_event(mouse_button):
	var viewport := get_viewport()
	var screen_center := viewport.get_visible_rect().size * 0.5

	var click_event := InputEventMouseButton.new()
	click_event.button_index = mouse_button
	click_event.pressed = true
	click_event.position = screen_center
	click_event.global_position = screen_center

	Input.parse_input_event(click_event)

	var release_event := InputEventMouseButton.new()
	release_event.button_index = mouse_button
	release_event.pressed = false
	release_event.position = screen_center
	release_event.global_position = screen_center

	Input.parse_input_event(release_event)

func _on_right_pressed() -> void:
	create_event(MOUSE_BUTTON_RIGHT)

func _on_left_pressed() -> void:
	create_event(MOUSE_BUTTON_LEFT)
