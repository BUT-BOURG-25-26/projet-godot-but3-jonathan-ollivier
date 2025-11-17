extends Control
class_name ShopOpen

@export var label: Label

func _ready() -> void:
	Game.instance.open.observe(update)
	update(false, Game.instance.open.get_value())

func update(old, new):
	if new:
		label.text = "OPEN"
		label.add_theme_color_override("font_color", Color.GREEN)
	else:
		label.text = "CLOSED"
		label.add_theme_color_override("font_color", Color.RED)
