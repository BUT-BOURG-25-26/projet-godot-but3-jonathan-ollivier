extends Node3D
class_name CheckoutCounter

@export var products: MixedProductStorage
@export var sound: AudioStreamPlayer3D
@export var price_label: Label3D

var total_price: float = 0
var paid: float = 0

func _ready():
	update_label()

func _on_products_clicked(player: Player, mouseButton: int) -> void:
	if player.in_hands is Box:
		products.add_item(player.in_hands.product)
		return
	if products.products.size() > 0:
		total_price += products.remove_last_item().unit_price
		update_label()
		sound.play()

func update_label():
	price_label.text = "TOTAL: %0.2f€\nPAID: %0.2f€\nDUE: %0.2f€" % [total_price, paid, max(0, paid - total_price)]
	
