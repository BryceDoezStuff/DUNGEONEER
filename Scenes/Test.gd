extends CharacterBody2D

var gravity = 9.5
@onready var raycast = $RayCast2D
@export var speed = 90
var player_chase = false
var player = null
var facing = 0

@onready var timer = $Timer

func _ready():
	timer.wait_time = 2
	timer.timeout.connect(_on_timer_timeout)
	timer.start()  # Start the timer

func _physics_process(delta):
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
	facing = (facing + 1) % 2  # Toggle between 0 and 1
	print("facing", facing)

