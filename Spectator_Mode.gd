extends Sprite2D

var speed = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.s:
		if Input.is_action_just_pressed("zoom_in"):
			$Camera2D.zoom += Vector2(1,1)
		if Input.is_action_just_pressed("zoom_out") and $Camera2D.zoom.x > 1 and $Camera2D.zoom.y > 1:
			$Camera2D.zoom -= Vector2(1,1)
		$Camera2D.enabled = true
		if Input.is_action_pressed("ui_up"):
			$".".position.y -= speed
			$".".frame = 0
		elif Input.is_action_pressed("ui_down"):
			$".".position.y += speed
			frame = 2
		elif Input.is_action_pressed("ui_left"):
			$".".position.x -= speed
			frame = 3
		elif Input.is_action_pressed("ui_right"):
			$".".position.x += speed
			frame = 1
	else:
		$Camera2D.enabled = false
