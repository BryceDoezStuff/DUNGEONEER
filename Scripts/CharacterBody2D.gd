extends CharacterBody2D

var speed = 100

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	else:
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
	
	if Global.camera == 1:
		$Camera2D.enabled = false
	else:
		$Camera2D.enabled = true
