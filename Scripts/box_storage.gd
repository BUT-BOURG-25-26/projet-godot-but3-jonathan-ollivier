extends Node3D
class_name BoxStorage

@export var box: Box

# --------------------
# Public methods
# --------------------
func interact(player: Player, mouseButton: int = MOUSE_BUTTON_LEFT):
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
		
	
	
	
