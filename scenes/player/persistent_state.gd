extends CharacterBody2D

class_name PersistentState

var state
var state_factory

const SPEED = 300.0
const JUMP_VELOCITY = -300.0

var is_jumping = false

#Debuging variables
var _timer = false
var _current_timer = 0.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	state_factory = StateFactory.new()
	change_state("idle")


func change_state(new_state_name):
	if state != null:
		state.queue_free()
	state = state_factory.get_state(new_state_name).new()
	state.setup(Callable(self, "change_state"), $AnimatedSprite2D, self)
	state.name = "current_state"
	add_child(state)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	#DEBUG timer
#	if _timer:
#		_current_timer += delta
#		if is_on_floor():
#			_timer = false
#			print(_current_timer)
#			_current_timer = 0.0

	#This is here to stop the jumping animation when the player lands.
	if is_jumping:
		if is_on_floor():
			is_jumping = false
			change_state("idle")
		
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		#_timer = true
		is_jumping = true
		velocity.y = JUMP_VELOCITY
		change_state("jump")


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
