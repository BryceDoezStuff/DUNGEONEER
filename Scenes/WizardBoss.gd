extends CharacterBody2D
class_name Boss

var gravity = 9.5
@export var speed = 90
var player_chase = false
var player = CharacterBody2D
var facing = 0
var attack = 0

@onready var timer = $Timer

func _ready():
	player = get_node("res://Assets/Images/PLayer.tscn")
	timer.wait_time = 10
	timer.timeout.connect(_on_timer_timeout)
	timer.start()  # Start the timer

func _physics_process(delta):
	if attack == 0:
		pass
	if attack > 0:
		attack = 0
	velocity.x = 0
	if !player_chase:
		if facing == 0:
			velocity.x = -speed
		elif facing == 1:
			velocity.x = speed

	# Apply gravity
		velocity.y += gravity * delta

	# Move the character
	move_and_slide()

func _on_timer_timeout():
	attack = attack + 1
	facing = (facing + 1) % 2  # Toggle between 0 and 1
	print("facing ", facing)
 
