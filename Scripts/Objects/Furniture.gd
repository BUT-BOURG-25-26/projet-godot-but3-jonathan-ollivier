extends Resource
class_name Furniture

@export var name: String
@export var price: float
@export var scene: PackedScene
var image_texture: ImageTexture

func create_ghost_model() -> Node3D:
	var scene = scene.instantiate()
	var model = scene.find_child("Model")
	if !model:
		return
	scene.remove_child(model)
	
	var meshes = model.find_children("*", "MeshInstance3D", true, false)
	for mesh in meshes:
		if mesh.mesh:
			for i in range(mesh.mesh.get_surface_count()):
				mesh.set_surface_override_material(i, Global.hover_material)
	
	return model

func load(scene: SceneTree) -> void:
	if !scene:
		return
	
	var subviewport := SubViewport.new()
	subviewport.size = Vector2(256, 256)
	subviewport.render_target_update_mode = SubViewport.UPDATE_ONCE
	subviewport.own_world_3d = true
	
	var root := Node3D.new()
	subviewport.add_child(root)
	
	var camera := Camera3D.new()
	camera.position = Vector3(0, 5.0, 10.5)
	camera.look_at(Vector3.ZERO, Vector3.UP)
	root.add_child(camera)
	
	var light := DirectionalLight3D.new()
	light.rotation = Vector3(-PI/4, PI/4, 0)
	root.add_child(light)
	
	var instance = self.scene.instantiate()
	instance.rotation.y = PI/2
	subviewport.add_child(instance)
	
	scene.current_scene.add_child(subviewport)
	
	await scene.process_frame
	await scene.process_frame
	
	var img := subviewport.get_viewport().get_texture().get_image()
	image_texture = ImageTexture.create_from_image(img)
	
	subviewport.queue_free()

func create() -> Rack:
	return scene.instantiate()
