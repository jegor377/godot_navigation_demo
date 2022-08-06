extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	yield(get_tree().create_timer(0.001), "timeout")
	var nav_mesh: NavigationMeshInstance = $Navigation/NavMesh
	print(nav_mesh)
	nav_mesh.call_deferred("bake_navigation_mesh")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
