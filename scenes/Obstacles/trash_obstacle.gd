extends "res://scenes/Obstacles/obstacle.gd"

var move_speed = 0 # if the speed of the obstacles is different, this adds to it. 

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("still")


func _physics_process(delta):
	move_obstacle_at_speed(move_speed)
