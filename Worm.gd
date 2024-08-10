extends CharacterBody2D



@export var health = 100
const time = 1
const SPEED = 10
@export var Direction = false
var thing = 1
var attacking = false

# false = updown true leftright


func _process(delta):
	if health < 0:
		health = 100
		print("wormydead D:")

func _ready():
	$Timer.start()

func _physics_process(delta):
	if attacking:
		$AnimationPlayer.play("Attack")
	if !attacking:
		if thing == 1:
			velocity.x = SPEED
			$Sprite2D.flip_h = 1
			$AnimationPlayer.play("move")
		if thing == 2:
			velocity.x = -SPEED
			$Sprite2D.flip_h = 0
			$AnimationPlayer.play("move")
		if thing > 2:
			thing = 1
		move_and_slide()

func _on_timer_timeout():
	$Timer.start()
	thing += 1


func _on_location_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		attacking = true
		await get_tree().create_timer(0.6).timeout
		attacking = false


func _on_hurtbox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass


func _on_hurtbox_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.name == "Delt":
		health -= 10000
