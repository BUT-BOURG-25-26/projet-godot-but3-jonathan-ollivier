extends Control
class_name ProductInCart

static var scene: PackedScene = preload("res://UI/Shop/ProductInCart.tscn")

@export var image: Panel
@export var name_label: Label
@export var quantity_label: Label
@export var price_label: Label

var product: Product
var count: int

func add_one():
	count += 1
	update_labels()

func update_labels():
	name_label.text = product.name
	quantity_label.text = "x" + str(count)
	price_label.text = str(product.unit_price * product.unit_per_box * count) + "$"

static func create(product: Product) -> ProductInCart:
	var instance: ProductInCart = scene.instantiate()
	instance.count = 1
	instance.product = product
	
	instance.update_labels()
	var stylebox = StyleBoxTexture.new()
	stylebox.texture = product.image_texture
	instance.image.add_theme_stylebox_override("panel", stylebox)
	
	return instance
	
