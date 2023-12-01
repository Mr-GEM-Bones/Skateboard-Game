extends State

class_name HitState

func _ready():
	animated_sprite.play("hit")
#	get_hit_stagger()
#
#func get_hit_stagger():
#	await get_tree().create_timer(1.0).timeout
#	print("wait finished")
#	$Player.change_state("idle")
