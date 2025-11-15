extends ExtendedBody
class_name Trash

static var scene: PackedScene = preload("res://Scenes/Objects/Trash.tscn")

func _on_clicked(player: Player, mouseButton: int) -> void:
	if player.in_hands is Box:
		player.in_hands.model.queue_free()
		player.in_hands.queue_free()
		player.in_hands = null


static func create() -> Trash:
	return scene.instantiate()
