extends Node

@export var bird_obstacle_scene: PackedScene
@export var ground_obstacle_scene: PackedScene

var speed = 240 # the basic speed that everything moves at. Change this for everything to move.
var spawnX = 782
var player_pos = Vector2(100,405)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.position = player_pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_bird_obstacle_hit():
	print("HitMain!")
	


func _on_bird_timer_timeout():
	#This timer handles all the obstacles on the sky
	var bird = bird_obstacle_scene.instantiate()
	var spawnY = 333
	
	bird.position = Vector2(spawnX,spawnY)
	#print(bird)
	
	add_child(bird)


func _on_ground_timer_timeout():
	#This timer handles the obstacles on the ground.
	var ground = ground_obstacle_scene.instantiate()
	var spawnY = 415 #this is about as high, close to the floor.
	
	ground.position = Vector2(spawnX, spawnY)
	
	add_child(ground)
	pass # Replace with function body.
