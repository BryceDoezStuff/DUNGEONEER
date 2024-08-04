extends CharacterBody2D

const time = 1
const SPEED = 50
@export var Direction = false
var thing = 1


# false = updown true leftright

func _ready():
	$timer.start()

func _physics_process(delta):
	if thing == 1:
		velocity.y -= SPEED
	if thing == 2:
		velocity.y += SPEED
	if thing > 2:
		thing = 1
	move_and_slide()

func _on_timer_timeout():
	$timer.start()
	thing += 1
