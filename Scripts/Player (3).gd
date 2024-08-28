extends CharacterBody2D
class_name Player


var climbing = false
var dash_cooldown = false
var animation_playing = false
var dashing = false
var speed = 2   #75= is speed
var jump_force = 215
var gravity = 20
var isattack = false
var dash_speed = 1000
var jumps = 2545454
var candash = true
var jump_count = 343434343
var ontrack = false
var cooldown = false


func _ready():
	pass






func _process(delta):
	if dashing:
		$CPUParticles2D2.emitting = true
	else:
		$CPUParticles2D2.emitting = false
	jumps = Global.modifier
	if ontrack:
		$AnimationPlayer.play("attack_2")
		Global.camera = 2
	if Global.camera == 1:
		$Camera2D.enabled = true
	else:
		$Camera2D.enabled = false
	if Input.is_action_just_pressed("Attack") and velocity.y == 0 and cooldown == false:
		isattack = true
		$timerattack.start()
		if Global.facing == 0:
			$AnimationPlayer.play("attack")
			await $AnimationPlayer.animation_finished and get_tree().create_timer(3).timeout
			isattack = false
			$AnimationPlayer.play("idle")
		if Global.facing == 1:
			$AnimationPlayer.play("attack_2")
			await $AnimationPlayer.animation_finished and get_tree().create_timer(3).timeout
			isattack = false
			$AnimationPlayer.play("idle")
		animation_playing = true
		await get_tree().create_timer(0.5).timeout
		animation_playing = false
func _physics_process(delta):
	
	if Global.boss_cam == false:
		$Camera2D.enabled = true
	else:
		$Camera2D.enabled = false
	if !ontrack and !Global.water and !isattack:
		speed = 75
		jump_force = 250
		gravity = 13
		Global.modifier = 2
		if Input.is_action_pressed("left") and !animation_playing and !Global.s and !Global.talking and !climbing:
			$Sprite2D.flip_h = 1
			$Attck.flip_h = 1
			$Sprite2D/Shadow.flip_h = 0
			$Sprite2D/Shadow.offset = Vector2(-1,0)
			$Attck.offset = Vector2(4,0)
			Global.facing = 0
			if velocity.y == 0 and (velocity.x > 0 or velocity.x < 0):
				$AnimationPlayer.play("run")
			if dashing:
				velocity.x -= dash_speed
			else:
				velocity.x = -speed
		elif Input.is_action_pressed("right") and !animation_playing and !Global.talking and !climbing:
			$Sprite2D.flip_h = 0
			$Sprite2D/Shadow.flip_h = 1
			$Sprite2D/Shadow.offset = Vector2(1,0)
			$Attck.flip_h = 0
			$Attck.offset = Vector2(0,0)
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
		if is_on_floor() and !Global.s and !Global.talking:
			if Input.is_action_just_pressed("jump") and !animation_playing:
				$AnimationPlayer.play("jump")
				velocity.y = -jump_force
				jump_count = 1  # Reset jump count on first jump
				print("Jumping from the floor")
		else:
			if Input.is_action_just_pressed("jump") and jump_count < jumps:
				$AnimationPlayer.play("jump")
				velocity.y = -jump_force
				jump_count += 1  # Increment jump count on double jump
				print("Double jump")
			if not dashing:
				velocity.y += gravity
			elif dashing:
				velocity.y = 0
	
	if Input.is_action_just_pressed("dash") and dashing == false and !dash_cooldown and !Global.talking:
		$Dashtime.start()
		$Dashcooldown.start()
		dash_cooldown = true
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
	
	
	
	
	
	#WATER MOVMENT
	if Global.water == true:
		Global.modifier = 99999999
		speed = 37
		jump_force = 50
		gravity = 4.75
		if Input.is_action_pressed("left") and !animation_playing:
			$Sprite2D.flip_h = 1
			$Attck.flip_h = 1
			$Sprite2D/Shadow.flip_h = 0
			$Sprite2D/Shadow.offset = Vector2(-1,0)
			$Attck.offset = Vector2(4,0)
			Global.facing = 0
			if velocity.y == 0 and (velocity.x > 0 or velocity.x < 0):
				$AnimationPlayer.play("run")
			if dashing:
				velocity.x -= dash_speed
			else:
				velocity.x = -speed
		elif Input.is_action_pressed("right") and !animation_playing:
			$Sprite2D.flip_h = 0
			$Sprite2D/Shadow.flip_h = 1
			$Sprite2D/Shadow.offset = Vector2(1,0)
			$Attck.flip_h = 0
			$Attck.offset = Vector2(0,0)
			Global.facing = 0
			if velocity.y == 0 and (velocity.x > 0 or velocity.x < 0):
				$AnimationPlayer.play("run")
			if dashing:
				velocity.x += dash_speed
				velocity.y = 0
			else:
				velocity.x = speed
		else:
			velocity.x = 0
			if velocity.x == 0 and velocity.y == 0 and $timerattack.is_stopped():
				$AnimationPlayer.play("idle")
			if not is_on_floor() and $timerattack.is_stopped():
				$AnimationPlayer.play("jump")
	
	# Jump handling
		if is_on_floor() or dashing:
			if Input.is_action_just_pressed("jump") and !animation_playing:
				$AnimationPlayer.play("jump")
				velocity.y = -jump_force
				jump_count = 1  # Reset jump count on first jump
				print("Jumping from the floor")
		else:
			if Input.is_action_just_pressed("jump") and jump_count < jumps:
				$AnimationPlayer.play("jump")
				velocity.y = -jump_force
				jump_count += 1  # Increment jump count on double jump
				print("Double jump")
			if not dashing:
				velocity.y += gravity
			elif dashing:
				velocity.y = 0

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass

func _on_area_2d_area_entered(area: Area2D):
	if area.name == "climeable_wall":
		climbing = true


func _on_dashcooldown_timeout():
	dash_cooldown = false


func _on_area_2d_area_exited(area: Area2D):
	climbing = false
