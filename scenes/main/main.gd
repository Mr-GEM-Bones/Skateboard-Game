extends Node

@export var bird_obstacle_scene: PackedScene

var speed = 240 # the basic speed that everything moves at. Change this for everything to move.
var spawnX = 782
var player_pos = Vector2(100,405)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.position = player_pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bird_obstacle_hit():
	print("HitMain!")
	


func _on_bird_timer_timeout():
	var bird = bird_obstacle_scene.instantiate()
	var spawnY = 333
	
	bird.position = Vector2(spawnX,spawnY)
	#print(bird)
	
	add_child(bird)
