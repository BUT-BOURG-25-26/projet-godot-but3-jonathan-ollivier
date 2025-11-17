extends Control
class_name BuyableFurniture

static var scene: PackedScene = preload("res://UI/Shop/BuyableFurniture.tscn")

signal add(furniture: Furniture)

var furniture: Furniture

@export var image: Panel

@export var name_label: Label
@export var price_label: Label

static func create(furniture: Furniture) -> BuyableFurniture:
	var instance = scene.instantiate()
	instance.furniture = furniture
	
	instance.name_label.text = furniture.name
	instance.price_label.text = str(furniture.price) + "$"
	
	var stylebox = StyleBoxTexture.new()
	stylebox.texture = furniture.image_texture
	instance.image.add_theme_stylebox_override("panel", stylebox)
	
	return instance


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
		add.emit(furniture)
