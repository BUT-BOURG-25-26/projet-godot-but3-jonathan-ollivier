extends Resource
class_name Task

var npc: NPC

func _init(npc: NPC) -> void:
	self.npc = npc

func start() -> void:
	return

func finish() -> void:
	return

func finished() -> bool:
	return true

func loop() -> void:
	return
