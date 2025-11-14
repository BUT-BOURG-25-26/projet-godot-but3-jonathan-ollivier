extends Control
class_name MoneyCount

@export var label: Label
var value: int

func _process(delta: float) -> void:
	if value != Game.instance.money:
		value = Game.instance.money
		label.text = "%.2f$" % value
