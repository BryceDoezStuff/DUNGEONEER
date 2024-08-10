extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_waters_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		Global.water = true


func _on_waters_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		Global.water = false
