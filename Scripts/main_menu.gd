extends Control
class_name MainMenu

@export var loading_screen: ColorRect

func _ready():
	if !Global.loaded:
		loading_screen.show()
		await Global.loaded_signal
		loading_screen.hide()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
