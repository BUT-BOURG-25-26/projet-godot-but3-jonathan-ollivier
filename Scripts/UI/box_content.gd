extends Control

@export var label: Label
@export var player: Player

func _process(delta):
	if player.in_hands is Box:
		var box = (player.in_hands as Box)
		label.text = "%d %s" % [box.product_count, box.product.name]
	else:
		label.text = ""
