extends CanvasLayer

var _health # Has all the hearts and love


func _ready():
	# update and hide all the hearts.
	_health = $Health.get_children()
	reset_hearts()
	

func reset_hearts():
	#hides all the hearts
	for i in _health:
		i.hide()

func update_health(health):
	reset_hearts()
	
	#Show all the available hearts
	if health>=0:
		for i in health:
			_health[i].show()


func update_score(score):
	$Score.text = str(score)
