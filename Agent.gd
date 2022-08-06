extends KinematicCharacter


export(NodePath) var target_path
export(float) var base_speed = 5

var run := false

onready var nav_agent: NavigationAgent = $NavigationAgent

func _ready():
	gravity = 0

func _manipulate_velocities(delta: float) -> void:
	if run:
		var curr_pos := global_transform.origin
		var target := nav_agent.get_next_location()
		var velocity := Vector3.ZERO
		velocity = curr_pos.direction_to(target) * base_speed
	#	print(curr_pos, ' ', target, ' ', nav_agent.get_target_location(), ' ', velocity)
		nav_agent.set_velocity(no_y(velocity))
		print(nav_agent.is_target_reachable(), ' ', nav_agent.is_navigation_finished())


func no_y(vec: Vector3) -> Vector3:
	return vec * Vector3(1, 0, 1)


func _on_Timer_timeout():
	gravity = 98
	print("START")
	var target_node: Spatial = get_node(target_path)
	nav_agent.set_target_location(target_node.global_transform.origin)
	run = true


func _on_NavigationAgent_velocity_computed(safe_velocity):
	static_velocity = safe_velocity
