extends Control


var is_opened = false


func _ready():
	close()


func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if is_opened:
			close()
		else:
			open()


func  open():
	Engine.time_scale = 0
	$".".visible = true
	is_opened = true

func close():
	Engine.time_scale = 1
	$".".visible = false
	is_opened = false





