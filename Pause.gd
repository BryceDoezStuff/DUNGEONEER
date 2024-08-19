extends Control

var paused = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if paused == 1:
		pause()
	elif paused == 0:
		unpause()
	if Input.is_action_just_pressed("pause"):
		paused += 1
		if paused > 1:
			paused = 0

func _on_quit_to_deskop_pressed():
	get_tree().quit()


func _on_back_to_home_pressed():
	SceneTrans.change_scene_to_file("res://Scenes/Main_Menu.tscn")



func pause():
	$".".show()
	Engine.time_scale = 0
func unpause():
	$".".hide()
	Engine.time_scale = 1
