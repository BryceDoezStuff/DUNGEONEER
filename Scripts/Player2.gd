extends CharacterBody2D



var electrified = false
@onready var main = get_tree().get_root().get_node(".")
@onready var projectile = load("res://Scenes/projectile.tscn")
@export var speed: float = 90
@export var jump_force: float = -200.0
@export var gravity: float = 10.0
@export var max_jumps: int = Global.modifier
@export var sprite_index: int = Global.Charachter2

@onready var sprites: Array = [$Char1, $Bob, $Joe, $Amy, $Tom]
@export var inv: inv

var active_sprite: AnimatedSprite2D
var jumps_left: int = max_jumps
var bow_equiped = true
var bow_cooldown = true
var arrow = preload("res://Scenes/projectile.tscn")
var health = Global.player_health

func _ready():
	if Global.mp == false:
		queue_free()
	else:
		queue_redraw()
	$Char878.play("Shocked")
	set_active_sprite()
	if Global.area: 
		position = position + Vector2(-768,270)
		await get_tree().create_timer(0.1).timeout
		Global.area = false
		if Global.modifier >2:
			pass


func set_active_sprite():
	if sprite_index >= 0 and sprite_index < sprites.size():
		active_sprite = sprites[sprite_index]
		for sprite in sprites:
			sprite.visible = false
		active_sprite.visible = true
	else:
		print("Invalid sprite index")

func _physics_process(delta: float) -> void:
	velocity.y += gravity
	print(position)

	
	if Input.is_action_pressed("P2right"):
		velocity.x = speed
		active_sprite.flip_h = false
	elif Input.is_action_pressed("P2left"):
		velocity.x = -speed
		active_sprite.flip_h = true
	else:
		velocity.x = 0

	# Jumping
	if is_on_floor():
		jumps_left = max_jumps  # Reset jump count when on the ground
	if Input.is_action_just_pressed("P2jump") and jumps_left > 0:
		$AudioStreamPlayer2D.play()
		velocity.y = jump_force
		jumps_left -= 1

	# Apply movement
	move_and_slide()
	
	
	var mouse_pos = get_global_mouse_position()
	$Marker2D.look_at(mouse_pos)
	
	
	if Input.is_action_just_pressed("left_mouse") and bow_equiped and bow_cooldown:
		bow_cooldown = false
		var arrow_instance = arrow.instantiate()
		arrow_instance.rotation = $Marker2D.rotation
		arrow_instance.global_position = $Marker2D.global_position
		add_child(arrow_instance)
		

	# Animation handling (optional)
	if is_on_floor():
		if velocity.x == 0:
			active_sprite.play("idle")
		else:
			active_sprite.play("run")
	else:
			active_sprite.play("jump")


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Thing":
		jumps_left = max_jumps
	if body.name == "walljump":
		jumps_left = 1
	if body.name == "Elec":
		electrified = true
		get_tree().create_timer(0.1).timeout
		electrified = false
		








func _on_area_2d_2_body_shape_entered(area):
	if area.name == "jumpmod":
		max_jumps = 3
		Global.modifier = true


func _Playerisme():
	$Camera2D.enabled = false
	

func _process(delta):
	if Global.mp == false:
		queue_free()
	else:
		queue_redraw()
	max_jumps = Global.modifier
	health = Global.player_health
	if Global.player_health < 1:
		Global.player_health = 3
		get_tree().reload_current_scene()
		
	
	
		
	if Global.player_health == 3:
		$Health_visual_manager.play("Health3")
		$Label.text = "3"
	if Global.player_health == 2:
		$Health_visual_manager.play("Health2")
		$Label.text = "2"
	if Global.player_health == 1:
		$Health_visual_manager.play("Health1")
		$Label.text = "1"
		
		
	if electrified == true:
		$Char1.show()
		$Bob.hide()
		Engine.time_scale = 1
	if electrified == false:
		Engine.time_scale = 1
		$Char1.hide()
		$Bob.show()
		
	if sprite_index == 1:
		speed = 90
		jump_force = -200.0
		gravity = 10.0
		$Bob.visible = true
	else:
		$Bob.visible = false
	
	if sprite_index == 2:
		speed = 75
		jump_force = -230.0
		gravity = 10.0
		$Joe.visible = true
	else:
		$Joe.visible = false
	
	if sprite_index == 3:
		speed = 120
		jump_force = -195.0
		gravity = 10.0
		$Amy.visible = true
	else:
		$Amy.visible = false
		
	if sprite_index == 4:
		speed = 95
		jump_force = -210.0
		gravity = 10.0
		$Tom.visible = true
	else:
		$Tom.visible = false


func  death():
	Global.camera = Global.camera + 1
	
