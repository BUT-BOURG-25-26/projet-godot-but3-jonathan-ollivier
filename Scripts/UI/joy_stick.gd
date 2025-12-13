extends Control

func _ready():
	var is_mobile := OS.has_feature("mobile")
	if not is_mobile:
		for child in get_children():
			child.hide()
