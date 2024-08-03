extends CharacterBody2D

var dashing = false
var facing
var speed = 75
const jump_force = 215
var gravity = 9.5
var isattack = false
var dash_speed = 1000
var jumps = 2
var candash = true

func _process(delta):
	if Input.is_action_just_pressed("1"):
		Global.camera = 1
	if Input.is_action_just_pressed("2"):
		Global.camera = 2
	if Global.camera == 1:
		$Camera2D.enabled = true
	else:
		$Camera2D.enabled = false
	if Input.is_action_just_pressed("Attack"):
		$timerattack.start()
		if facing == 0:
			$AnimationPlayer.play("attack")
		if facing == 1:
			$AnimationPlayer.play("attack_2")

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		$Sprite2D.flip_h = 1
		facing = 1
		if velocity.y == 0:
			$AnimationPlayer.play("run")
		if dashing:
			velocity.x = -dash_speed
		else:
			velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		$Sprite2D.flip_h = 0
		facing = 0
		if velocity.y == 0 and velocity.x > 0 or velocity.x < 0:
			$AnimationPlayer.play("run")
		if dashing:
			velocity.x += dash_speed
		else:
			velocity.x = speed
		
	else:
		velocity.x = 0
		if velocity.x == 0 and velocity.y == 0 and $timerattack.is_stopped():
			$AnimationPlayer.play("idle")
		if not is_on_floor() and $timerattack.is_stopped():
			$AnimationPlayer.play("jump")
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			$AnimationPlayer.play("jump")
			velocity.y -= jump_force
	else:
		if !dashing:
			velocity.y += gravity
	if Input.is_action_just_pressed("dash"):
		$Dashtime.start()
	if $Dashtime.is_stopped():
		dashing = false
	else:
		dashing = true
	
	
	if velocity.x > 250:
		velocity.x = 250
	if velocity.x < -250:
		velocity.x = -250
	
	move_and_slide()
	



