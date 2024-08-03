extends CharacterBody2D

var speed = 900

func _ready():
	if Global.direction == 1:
		speed = 900
	else:
		speed = -900

func _process(delta):
	velocity.x = speed
	
	move_and_slide()
