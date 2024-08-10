extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Arrows.text = str(Global.AMMO)
	if Global.AMMO <= 0:
		$Arrows.hide()
		$Sprite2D.hide()
	else:
		$Arrows.show()
		$Sprite2D.show()
