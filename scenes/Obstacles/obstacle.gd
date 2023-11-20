extends RigidBody2D
signal hit



func move_obstacle_at_speed(offset_speed):
	#Sets the velocity of the obstacle in relation to the main speed. Requieres obstacle to be child of Main.
	var velocity = Vector2.LEFT * (get_parent().speed + offset_speed)
	linear_velocity = velocity

func _on_body_entered(body):
	#Adds funtionality to the obstacle hiting player.
	if body.collision_layer == 1:
		hit.emit()
		queue_free()



func _on_visible_on_screen_notifier_2d_screen_exited():
	# Obstacle deletes when it is of screen.
	queue_free()


