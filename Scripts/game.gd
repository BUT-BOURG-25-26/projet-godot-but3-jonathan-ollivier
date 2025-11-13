extends Node3D
class_name Game

static var game: Game

@export var navigation_region: NavigationRegion3D
@export var player: Player

var aisles: Array[Aisle] = []
var racks: Array[Rack] = []
var npcs: Array[NPC] = []


func _ready() -> void:
	game = self
	
	for i in range(len(Global.products)):
		var product = Global.products[i]
		product.load()
		
		var box = Box.create(product)
		box.position = Vector3(0, 10 + 2*i, -10)
		navigation_region.add_child(box)
	
	var rack = Rack.create()
	rack.position = Vector3(-8, 0, -22)
	navigation_region.add_child(rack)
	
	var aisle = Aisle.create()
	aisle.position = Vector3(-8, 0, -5)
	aisle.fill_randomly()
	navigation_region.add_child(aisle)
	aisles.append(aisle)
	
	var checkout_counter = CheckoutCounter.create()
	checkout_counter.position = Vector3(7, 0, 11)
	navigation_region.add_child(checkout_counter)
	
	navigation_region.bake_navigation_mesh()
	
	for i in range(4):
		var npc = NPC.create()
		npc.position = Vector3(20, 10, -10 + 5*i)
		navigation_region.add_child(npc)
	
	
func _process(delta):
	if Input.is_action_pressed("dev"):
		for npc in npcs:
			npc.go_to(player.global_position)
	
	
