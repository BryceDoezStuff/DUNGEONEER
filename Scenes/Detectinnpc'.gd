extends Area2D


@export var ID = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		$Sprite2D.show()
	else:
		$Sprite2D.hide()
	if body is Player and Input.is_action_just_pressed("e"):
		if ID == 0:
			TextManager.name_of_char = "Sign"
			TextManager.words = "This is a sign, do you think you can read?"
			TextManager.display_text()
		if ID == 1:
			pass
