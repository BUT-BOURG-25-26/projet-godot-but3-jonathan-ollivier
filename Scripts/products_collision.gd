extends CollisionShape3D

@export var box: CSGBox3D

func _ready():
	shape.size = box.size
	
	
