extends RigidBody2D
signal hit

@export var move_speed = 350

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(position)
	$AnimatedSprite2D.play("fly")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	var velocity = Vector2.LEFT * move_speed
#	position += velocity*delta

func _physics_process(delta):
	var velocity = Vector2.LEFT * move_speed
	linear_velocity = velocity

func _on_body_entered(body):
	hit.emit()
	queue_free()



func _on_visible_on_screen_notifier_2d_screen_exited():
	#print("Bird Died")
	queue_free()


