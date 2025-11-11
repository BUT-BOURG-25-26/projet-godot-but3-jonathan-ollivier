extends Node3D
class_name BoxStorage

signal clicked(player: Player,  mouseButton: int)

@export var box: Box

func _on_clicked(player: Player, mouseButton: int) -> void:
	if !box:
		if player.in_hands is not Box:
			return
		var box = player.in_hands
		player.clear_hand()
		box.pick(self)
		self.box = box
	else:
		if !player.in_hands:
			player.get_in_hand(box)
			self.box = null
