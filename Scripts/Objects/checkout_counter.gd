extends Node3D
class_name CheckoutCounter

@export var productContainer: MixedProductStorage
@export var sound: AudioStreamPlayer3D
@export var price_label: Label3D
@export var queue_start: Node3D
@export var queue2: Node3D

var total_price: float = 0
var paid: float = 0
var queue: Array[NPC] = []

static var scene: PackedScene = preload("res://Scenes/Objects/CheckoutCounter.tscn")

func _ready():
	update_label()

func _on_products_clicked(player: Player, mouseButton: int) -> void:
	if player.in_hands is Box:
		productContainer.add_item(player.in_hands.product)
		return
	if productContainer.hasProducts():
		total_price += productContainer.remove_last_item().unit_price
		update_label()
		sound.play()
	
	if !productContainer.hasProducts():
		paid = total_price + randi_range(0,10)
		update_label()

func update_label():
	price_label.text = "TOTAL: %0.2f€\nPAID: %0.2f€\nDUE: %0.2f€" % [total_price, paid, max(0, paid - total_price)]

# retourne la position de la n-ieme place de la file d'attente
func queue_position(n: int = -1) -> Vector3:
	if n == -1:
		n = queue.size()
	var delta = queue2.global_position - queue_start.global_position
	return queue_start.global_position + delta * n

func add_to_queue(npc: NPC) -> int:
	queue.append(npc)
	return queue.size() - 1

func customer_position(npc: NPC) -> int:
	return queue.find(npc)

func current_customer() -> NPC:
	return queue[0] if !queue.is_empty() else null

func add_item(product: Product) -> void:
	productContainer.add_item(product)

static func create():
	return scene.instantiate()
