extends Control


var paused = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$VBoxContainer/Label2.text = ("FPS " + str(Engine.get_frames_per_second()))
	$VBoxContainer/Label3.text = str("DUNGEONEERS-VER-",Global.version)
	$VBoxContainer/Label4.text = str("SAVE_POINT ", Global.save)
	$VBoxContainer/Label5.text = str("GRAPHICS_INFO: ", RenderingServer.get_rendering_device().get_device_name())
	$VBoxContainer/Label6.text = str("USERNAME_SYSTEM: ", OS.get_environment("USERNAME"))
	if paused == 1:
		pause()
	elif paused == 0:
		unpause()
	if Input.is_action_just_pressed("Debug_Menu"):
		paused += 1
		if paused > 1:
			paused = 0


func _on_check_button_toggled(toggled_on):
	Global.modifier = Global.infinite
	if !toggled_on:
		Global.modifier = Global.modifer_save


func pause():
	$".".show()
func unpause():
	$".".hide()
