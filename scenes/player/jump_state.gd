extends State

class_name JumpState

func _ready():
	animated_sprite.play("jump")
	await get_tree().create_timer(1.0).timeout
	#print("wait finished")
	change_state.call_func("idle")
