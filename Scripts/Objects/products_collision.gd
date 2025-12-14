extends CollisionShape3D

@export var box: CSGBox3D

func _ready():
	shape = shape.duplicate()
	shape.size = box.size
	
	
