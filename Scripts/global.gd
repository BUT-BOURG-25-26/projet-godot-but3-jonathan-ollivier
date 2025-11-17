extends Node
# class_name déclaré dans le autoload

var dev = true

var gravity := 20

var TERRAIN := 1 << 0
var ENTITIES := 1 << 1
var CLICKABLE := 1 << 2
var HOLDABLE := 1 << 3
var HOVERABLE := 1 << 4

var products: Array[Product] = []
var furnitures: Array[Furniture] = []

var hover_material: StandardMaterial3D = ResourceLoader.load("res://Assets/Materials/hovered.tres")

func _ready() -> void:
	for file in ResourceLoader.list_directory("res://Resources/Products/"):
		var product: Product = ResourceLoader.load("res://Resources/Products/" + file)
		await product.load(get_tree())
		products.push_back(product)
	
	for file in ResourceLoader.list_directory("res://Resources/Furnitures/"):
		var furniture: Furniture = ResourceLoader.load("res://Resources/Furnitures/" + file)
		await furniture.load(get_tree())
		furnitures.push_back(furniture)


func is_on_layer(node: Node3D, layer_mask: int) -> bool:
	if not node.has_method("get_collision_layer"):
		return false
	return node.get_collision_layer() & layer_mask != 0
