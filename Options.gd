extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("e")
	$AnimationPlayer2.play("Scrolldown")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0,value)


func _on_check_box_toggled(toggled_on):
	AudioServer.set_bus_mute(0,toggled_on)


func _on_option_button_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1152,648))
		1:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		2:
			DisplayServer.window_set_size(Vector2i(1600,900))
		3:
			DisplayServer.window_set_size(Vector2i(1280,720))


func _on_button_pressed():
	SceneTrans.change_scene_to_file("res://Scenes/Main_Menu.tscn")


func _on_check_box_2_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(3,0)
	elif !toggled_on:
		DisplayServer.window_set_mode(0,0)


func _on_check_button_toggled(toggled_on):
	pass # Replace with function body.


func _on_option_button_2_item_selected(index):
	match index:
		0:
			Engine.max_fps = 200
		1:
			Engine.max_fps = 120
		2:
			Engine.max_fps = 90
		3:
			Engine.max_fps = 60
		4:
			Engine.max_fps = 45
		5:
			Engine.max_fps = 30


func _on_check_box_3_toggled(toggled_on):
	if toggled_on:
		Global.vhs = true
	elif !toggled_on:
		Global.vhs = false

