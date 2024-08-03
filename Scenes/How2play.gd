extends Control


@export var option = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if option > 5:
		option = 1
		get_tree().change_scene_to_file("res://Scenes/Main_Menu.tscn")
		print("didit")
	if option < 1:
		get_tree().change_scene_to_file("res://Scenes/Main_Menu.tscn")
		option = 5
		print("didit")
	
	if option == 1:
		$AspectRatioContainer/slide1.visible = true
		$Label.text = " "
	else:
		$AspectRatioContainer/slide1.visible = false
	
	if option == 2:
		$AspectRatioContainer/slide2.visible = true
		$Label.text = "This is a pressure plate, it can open doors and other things..."
	else:
		$AspectRatioContainer/slide2.visible = false
	
	if option == 3:
		$"AspectRatioContainer/slide 3".visible = true
		$Label.text = " "
	else:
		$"AspectRatioContainer/slide 3".visible = false
	
	
	if option == 4:
		$AspectRatioContainer/slide4.visible = true
		$Label.text = "This is an ! it can show you things that you have done or secrets that a key has unlocked"
	else:
		$AspectRatioContainer/slide4.visible = false
		
	
	if option == 5:
		$AspectRatioContainer/slide5.visible = true
		$Label.text = "This is a jorb, it can reset you double jumps!"
	else:
		$AspectRatioContainer/slide5.visible = false
		


func _on_next_pressed():
	option = option +1


func _on_back_pressed():
	option = option -1
