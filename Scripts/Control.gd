extends Control


func _on_button_pressed():
	if Global.level == 1:
		get_tree().change_scene_to_file("res://Level.tscn")
	if Global.level == 2:
		get_tree().change_scene_to_file("res://Level2.tscn")
	if Global.level == 3:
		get_tree().change_scene_to_file("res://Scenes/Lavel3.tscn")
