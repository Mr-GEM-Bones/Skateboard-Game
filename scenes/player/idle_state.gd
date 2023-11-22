extends State

class_name IdleState
# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.play("idle")
