extends Node3D
class_name BoxStorage

@export var box: Box
@export var front: Node3D
@export var mesh_instance: MeshInstance3D

func _on_box_clicked(player: Player, mouseButton: int) -> void:
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

func _on_box_hovered(player: Player) -> void:
	mesh_instance.visible = player.in_hands is Box


func _on_box_unhovered(player: Player) -> void:
	mesh_instance.visible = false
