extends Task
class_name GotoTask

var position: Vector3

func _init(npc: NPC, pos: Vector3):
	super._init(npc)
	position = pos

func start():
	position.y = 0
	npc.agent.target_position = position

func finished():
	return npc.agent.is_target_reached()

func loop():
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
