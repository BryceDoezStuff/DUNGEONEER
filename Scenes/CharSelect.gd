extends Control

var option = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if option > 4:
		option = 1
		print("didit")
	if option < 1:
		option = 4
		print("didit")

	
	if option == 1:
		Global.Charachter = 1
		$Bobgraphic.visible = true
	else:
		$Bobgraphic.visible = false
	
	if option == 2:
		Global.Charachter = 2
		$Joegraphic.visible = true
	else:
		$Joegraphic.visible = false
	
	if option == 3:
		Global.Charachter = 3
		$Amygraphic.visible = true
	else:
		$Amygraphic.visible = false
	if option == 4:
		Global.Charachter = 4
		$Tomgraphic.visible = true
	else:
		$Tomgraphic.visible = false


func _on_up_pressed():
	option = option - 1


func _on_down_pressed():
	option = option + 1


func _on_select_pressed():
	Global.level = 2
	get_tree().change_scene_to_file("res://Scenes/Level2.tscn")


func _on_exit_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main_Menu.tscn")

