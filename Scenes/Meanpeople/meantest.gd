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

func _on_hitbox_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.name == "Delt":
		$Sprite2D.frame = 212
		await get_tree().create_timer(0.2).timeout
		$Sprite2D.frame = 213
		await get_tree().create_timer(0.5).timeout
		$Sprite2D.frame = 212
