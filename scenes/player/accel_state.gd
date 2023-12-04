extends State

class_name AccelState

var move_speed = 300.0
var jump_velocity = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.play("accelerate")
	persistent_state.velocity.x += move_speed
	persistent_state.move_and_slide()

func _physics_process(_delta):
	# Handle Jump.
	#if Input.is_action_just_pressed("jump") and persistent_state.is_on_floor():
	#	persistent_state.motion_velocity.y = jump_velocity
	
	while Input.is_action_pressed("ui_right"): 
		persistent_state.velocity.x = move_speed
		persistent_state.move_and_slide()

	
#if Input.is_action_just_released("ui_right"):
#	persistent_state.velocity -= move_speed
#	change_state.call("idle")
