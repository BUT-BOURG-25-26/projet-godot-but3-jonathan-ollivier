extends Task
class_name CheckoutTask

var product_storage: ProductStorage
var count: int

func _init(npc: NPC, ps: ProductStorage, c: int):
	super._init(npc)
	product_storage = ps
	count = c

func finished():
	return count == 0

func loop():
	if !npc.cooldown.is_stopped():
		return
	
	if count > 0 and product_storage.count > 0:
		product_storage.remove_one()
		npc.animate(npc.animations.interact)
		npc.products.append(product_storage.product)
		npc.cooldown.start(1)
