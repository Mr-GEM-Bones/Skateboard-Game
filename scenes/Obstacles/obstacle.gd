extends RigidBody2D
signal hit

var is_hit = false # whenever the obstacle is hit.

func move_obstacle_at_speed(offset_speed):
	#Sets the velocity of the obstacle in relation to the main speed. Requieres obstacle to be child of Main.
	if !is_hit:
		var velocity = Vector2.LEFT * (get_parent().speed + offset_speed)
		linear_velocity = velocity

func _on_body_entered(body):
	#Adds funtionality to the obstacle hiting player.
	if body.collision_layer == 1:
		hit.emit()
		obstacle_hit_reaction()

func obstacle_hit_reaction():
	#queue_free()
	is_hit = true
	linear_velocity = Vector2.ZERO
	apply_impulse(Vector2(1,-1)*300)
	gravity_scale = 1
	$CollisionShape2D.PROCESS_MODE_DISABLED


func _on_visible_on_screen_notifier_2d_screen_exited():
	# Obstacle deletes when it is of screen.
	queue_free()


