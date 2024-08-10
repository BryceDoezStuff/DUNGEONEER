extends CharacterBody2D



var gravity = 30



func _physics_process(delta):
	$".".velocity.y += gravity
	
	move_and_slide()
	
	
	if Input.is_action_just_pressed("Attack"):
		pass
