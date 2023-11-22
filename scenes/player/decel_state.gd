extends State

class_name DecelState

var move_speed = persistent_state.SPEED
var jump_velocity = persistent_state.JUMP_VELOCITY

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.play("decelerate")
	persistent_state.motion_velocity.x = move_speed * -1

func _physics_process(_delta):
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and persistent_state.is_on_floor():
		persistent_state.motion_velocity.y = jump_velocity
	
	if Input.is_action_pressed("ui_left"): 
		persistent_state.motion_velocity.x = move_speed * -1
	else:
		persistent_state.motion_velocity.x = 0
		change_state.call_func("idle")

