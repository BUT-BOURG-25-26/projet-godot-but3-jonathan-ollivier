extends Label

var value: int

func _process(_delta):
	if Game.instance.money != value:
		value = Game.instance.money
		text = "Current balance: " + str(value) + "$"
