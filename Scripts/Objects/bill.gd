extends ExtendedArea
class_name Bill

signal add(value: int)

@export var value: int
@export var texture: CompressedTexture2D

func _ready():
	var material = StandardMaterial3D.new()
	material.albedo_texture = texture
	material.uv1_scale.x = -1
	$Model.material = material


func _on_clicked(player: Player, mouseButton: int) -> void:
	add.emit(value)
