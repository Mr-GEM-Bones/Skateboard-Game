extends Node

@export var bird_obstacle_scene: PackedScene
@export var ground_obstacle_scene: PackedScene

var speed = 240 # the basic speed that everything moves at. Change this for everything to move.
var spawnX = 782
var player_pos = Vector2(100,405)
var player_health = 3 #player health. 
var player_score = 0 #player score.

# Called when the node enters the scene tree for the first time.
func _ready():
	start_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player_score += 1
	$HUD.update_score(player_score)

func start_game():
	#this function starts the game.
	$HUD.update_score(player_score)
	
	#Player position
	$Player.position = player_pos
	
	#Set up the health.
	$HUD.update_health(player_health)

func player_hit():
	player_health -= 1
	$HUD.update_health(player_health)
	if player_health <= 0:
		game_over()

func game_over():
	print("Game Over!")
	


func _on_bird_timer_timeout():
	#This timer handles all the obstacles on the sky
	var bird = bird_obstacle_scene.instantiate()
	var spawnY = 333
	
	bird.position = Vector2(spawnX,spawnY)
	#print(bird)
	
	#suscribe to the hit signal.
	bird.hit.connect(player_hit)
	
	add_child(bird)


func _on_ground_timer_timeout():
	#This timer handles the obstacles on the ground.
	var ground = ground_obstacle_scene.instantiate()
	var spawnY = 415 #this is about as high, close to the floor.
	
	ground.position = Vector2(spawnX, spawnY)
	
		#suscribe to the hit signal.
	ground.hit.connect(player_hit)
	
	add_child(ground)
	pass # Replace with function body.
