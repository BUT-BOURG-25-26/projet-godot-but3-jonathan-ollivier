extends ExtendedBody
class_name Trash

static var scene: PackedScene = preload("res://Scenes/Objects/Trash.tscn")

var BOX_SELL_PRICE = 3

func _on_clicked(player: Player, mouseButton: int) -> void:
	if player.in_hands is Box:
		player.in_hands.model.queue_free()
		player.in_hands.queue_free()
		player.in_hands = null
		Game.instance.money.set_value(Game.instance.money.get_value() + BOX_SELL_PRICE)


static func create() -> Trash:
	return scene.instantiate()
