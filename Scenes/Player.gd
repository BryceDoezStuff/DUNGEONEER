extends CharacterBody2D
class_name Player



var dashing = false
var speed = 75
const jump_force = 215
var gravity = 9.5
var isattack = false
var dash_speed = 1000
var jumps = 2
var candash = true
var jump_count = 0  # New variable to keep track of jumps
var ontrack = true



func _process(delta):
	if ontrack:
		$AnimationPlayer.play("attack_2")
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
		if Global.facing == 0:
			$AnimationPlayer.play("attack")
		if Global.facing == 1:
			$AnimationPlayer.play("attack_2")

func _physics_process(delta):
	
	if Global.boss_cam == false:
		$Camera2D.enabled = true
	else:
		$Camera2D.enabled = false
	if !ontrack:
		if Input.is_action_pressed("left"):
			$Sprite2D.flip_h = 1
			Global.facing = 0
			if velocity.y == 0 and (velocity.x > 0 or velocity.x < 0):
				$AnimationPlayer.play("run")
			if dashing:
				velocity.x -= dash_speed
			else:
				velocity.x = -speed
		elif Input.is_action_pressed("right"):
			$Sprite2D.flip_h = 0
			Global.facing = 0
			if velocity.y == 0 and (velocity.x > 0 or velocity.x < 0):
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
	
	# Jump handling
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			$AnimationPlayer.play("jump")
			velocity.y = -jump_force
			jump_count = 1  # Reset jump count on first jump
			print("Jumping from the floor")
	else:
		if Input.is_action_just_pressed("jump") and jump_count < Global.modifier:
			$AnimationPlayer.play("jump")
			velocity.y = -jump_force
			jump_count += 1  # Increment jump count on double jump
			print("Double jump")
		if not dashing:
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
	
	if is_on_floor():
		jump_count = 0  # Reset jump count when player is on the floor
	

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass

func _on_area_2d_area_entered(area):
	if area.name == "Spring":
		velocity.y = jump_force
		print("Spring jump")
