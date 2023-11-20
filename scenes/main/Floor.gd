extends Sprite2D

@export var reset_x = 127.0  # Magic number makes it seamless
var start_position # the start position of the sprite.
var travel_position # The position in which the floor resets.
#var speed = 240

func _ready():
	start_position = position
	travel_position = start_position + (Vector2.LEFT * reset_x)

func _process(delta):
	position += Vector2.LEFT * get_parent().speed * delta
	if position.x < travel_position.x:
		position = start_position
