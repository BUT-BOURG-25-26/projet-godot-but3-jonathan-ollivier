extends StaticBody3D
class_name Aisle

@export var products_storages: Array[ProductStorage]

static var scene: PackedScene = preload("res://Scenes/Objects/Aisle.tscn")

static func create() -> Aisle:
	return scene.instantiate()

func fill_randomly() -> void:
	for product_storage: ProductStorage in products_storages:
		var product = Global.products.pick_random()
		product_storage.set_product(product)
		product_storage.set_count(randi_range(0, product_storage.max_count / 3 - 1))
		
