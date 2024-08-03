extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer2/HBoxContainer/Label.text = Global.signtext
	if Global.signshown:
		$".".show()
	else:
		$".".hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
