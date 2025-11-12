extends CharacterBody3D 
class_name NPC

@export var agent: NavigationAgent3D
@export var SPEED = 10

static var scene: PackedScene = preload("res://Scenes/Entities/NPC.tscn")

func _ready() -> void:
	pass
	# TODO: créer une liste de course, pathfinding (entre rayons, a la caisse...)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= Global.gravity * delta
	var pos = agent.get_next_path_position()
	var dir = (pos - position).normalized()
	velocity.x = dir.x * SPEED
	velocity.z = dir.z * SPEED
	move_and_slide()

func go_to(pos: Vector3):
	agent.target_position = pos
	print(agent.get_current_navigation_path())

static func create() -> NPC:
	return scene.instantiate()
