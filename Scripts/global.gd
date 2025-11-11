extends Node
# class_name déclaré dans le autoload

static var PICKABLE := 1 << 1
static var STOCKAGE := 1 << 2

static func is_on_layer(node: Node3D, layer_mask: int) -> bool:
	if not node.has_method("get_collision_layer"):
		return false
	return node.get_collision_layer() & layer_mask != 0
