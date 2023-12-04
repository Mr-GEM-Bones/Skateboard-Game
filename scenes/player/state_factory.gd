class_name StateFactory

var states

func _init():
	states = {
		"hit": HitState,
		"idle": IdleState,
		"death": DeathState,
		"jump": JumpState,
		"ride": RideState
}

func get_state(state_name):
	if states.has(state_name):
		return states.get(state_name)
	else:
		printerr("No state ", state_name, " in state factory!")
