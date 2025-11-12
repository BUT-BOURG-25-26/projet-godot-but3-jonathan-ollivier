extends StaticBody3D
class_name Aisle

@export var products_storages: Array[ProductStorage] = []

static var scene: PackedScene = preload("res://Scenes/Objects/Aisle.tscn")

static func create() -> Rack:
	return scene.instantiate()
