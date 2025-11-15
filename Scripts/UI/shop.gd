extends Control
class_name Shop

@export var product_container: FlowContainer
@export var cart_container: VBoxContainer
@export var box_spawn_point: Node3D

func _ready() -> void:
	
	await get_tree().create_timer(1).timeout
	
	for prod in Global.products:
		var buyable = BuyableProduct.create(prod)
		buyable.add.connect(add_product)
		product_container.add_child(buyable)

func open():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	show()

func close():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	hide()

func toggle():
	if visible:
		close()
	else:
		open()

func add_product(product: Product):
	for p in cart_container.get_children():
		var prod = p as ProductInCart
		if prod.product.name == product.name:
			prod.add_one()
			return
	cart_container.add_child(ProductInCart.create(product))

func total_price():
	var total = 0
	for cart_product in cart_container.get_children():
		var cp = cart_product as ProductInCart
		total += cp.product.unit_per_box * cp.product.unit_price * cp.count
	return total

func _on_button_pressed() -> void:
	if Game.instance.money >= total_price():
		close()
		Game.instance.money -= total_price()
		for cart_product in cart_container.get_children():
			for i in range(cart_product.count):
				Game.instance.level.add_box(cart_product.product, box_spawn_point.position)
				await get_tree().create_timer(0.5).timeout
