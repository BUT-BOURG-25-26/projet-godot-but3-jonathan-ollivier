extends Task
class_name CheckoutTask

var checkout_counter: CheckoutCounter
var done: bool = false
var too_much_due: bool = false
var lane_pos: int = -1

func _init(npc: NPC, cc: CheckoutCounter):
	super._init(npc)
	checkout_counter = cc

func start():
	if npc.products.is_empty():
		done = true
		return
	checkout_counter.add_to_queue(npc)

func finish():
	super.finish()
	if too_much_due:
		npc.complain(npc.steal.pick_random(), 2)
		npc.SPEED *= 1.5
	else:
		npc.complain(npc.goodbye.pick_random(), 2)

func finished():
	return done

func loop():
	var cur_lane_pos = checkout_counter.customer_position(npc)
	print(cur_lane_pos, " ", lane_pos)
	if lane_pos != cur_lane_pos:
		lane_pos = cur_lane_pos
		var pos = checkout_counter.queue_position(lane_pos)
		npc.agent.target_position = pos
		print(pos)
	
	if !npc.agent.is_target_reached():
		pathfind()
		return
	
	npc.animate(npc.animations.idle)
	
	if checkout_counter.current_customer() == npc && !npc.products.is_empty():
		put_item()
		

func pathfind():
	var pos = npc.agent.get_next_path_position()
	var dir = (pos - npc.global_position).normalized()
	npc.velocity.x = dir.x * npc.SPEED
	npc.velocity.z = dir.z * npc.SPEED
		
	#  animation + regarder dans la bonne direction
	dir.y = 0
	if dir.length_squared() > 0.001:
		var look_at_position = npc.global_position + dir
		npc.look_at(look_at_position)
		npc.animate(npc.animations.walk)

func put_item():
	var product = npc.products.pop_front()
	checkout_counter.add_item(product)
	
	var look_at_pos = checkout_counter.global_position
	look_at_pos.y = 0
	npc.look_at(look_at_pos)
	npc.animate(npc.animations.interact)
	
	npc.cooldown.start(1)
