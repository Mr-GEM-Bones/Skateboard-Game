extends Node

@export var bird_obstacle_scene: PackedScene
@export var ground_obstacle_scene: PackedScene

var speed = 0 # the basic speed that everything moves at. Change this for everything to move.
var spawnX = 782
var speed_change = 120 #acceleration that the screen does to reach desired speed.
var target_speed = 0
var player_pos = Vector2(100,405)
var player_health = 3 #player health. 
var player_score = 0 #player score.
var is_active = false #is the game in play.
var is_invulnerable = false #Whenever the player is hit, they are invulnerable.

# Called when the node enters the scene tree for the first time.
func _ready():
	pass #start_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Don't run if game is not active.
	if !is_active:
		return
	
	player_score += 1
	$HUD.update_score(player_score)
	
	#Check if the target speed is different and change.
	if speed != target_speed:
		change_speed(target_speed, speed_change * delta)

func start_game():
	#this function starts the game.
	$HUD.update_score(0)
	
	#Player position
	$Player.position = player_pos
	
	#Set up the health.
	$HUD.update_health(player_health)
	
	#Start Obstacles
	$BirdTimer.start()
	$GroundTimer.start()
	
	#Start Speed
	target_speed = 240
	
	is_active = true

func player_hit():
	if is_invulnerable: 
		return
	
	player_health -= 1
	$HUD.update_health(player_health)
	if player_health <= 0:
		game_over()
	else: 
		$Player.change_state("hit")
		is_invulnerable = true
		await get_tree().create_timer(0.5).timeout
		$Player.change_state("idle")
		is_invulnerable = false
	
func game_over():
	print("Game Over!")
	
	target_speed = 0
	

func change_speed(_target_speed,_speed_delta):
	#sets the speed towards the target_speed at speed_delta.
	speed += sign(_target_speed - speed) * _speed_delta

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
