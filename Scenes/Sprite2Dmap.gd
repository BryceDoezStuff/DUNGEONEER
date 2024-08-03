extends Sprite2D

const SPEED = 200 

func _process(delta):
	print(position)
	# Input handling for movement
	var movement = Vector2.ZERO
	
	if Input.is_action_pressed("mapleft"):
		movement.x += 1
	if Input.is_action_pressed("mapright"):
		movement.x -= 1
	if Input.is_action_pressed("mapup"):
		movement.y += 1
	if Input.is_action_pressed("mapdown"):
		movement.y -= 1
	
	# Normalize diagonal movement to prevent faster movement
	if movement.length() > 0:
		movement = movement.normalized() * SPEED * delta
	
	# Move the sprite
	position += movement


