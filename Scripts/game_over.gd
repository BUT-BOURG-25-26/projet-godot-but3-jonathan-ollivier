extends Control
class_name GameOver

@export var statistics_label: Label

func _ready() -> void:
	statistics_label.text = """
	Statistics:
	Generated cash: %.2f$
	Customer count: %d
	Products bought: %d
	""" % [Statistics.generated_cash, Statistics.customer_count, Statistics.products_bought]

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
