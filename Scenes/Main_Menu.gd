extends Control


@export var option = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Panarama")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(option)
	if option > 4:
		option = 1
		print("didit")
	if option < 1:
		option = 4
		print("didit")
	
	if option == 1:
		$Gui5.visible = true
	else:
		$Gui5.visible = false
	
	if option == 2:
		$Gui6.visible = true
	else:
		$Gui6.visible = false
	
	if option == 3:
		$Gui2.visible = true
	else:
		$Gui2.visible = false
	if option == 4:
		$Gui7.visible = true
		$Node2D.hide()
	else:
		$Gui7.visible = false
		$Node2D.show()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/CharSelect.tscn")
	Global.level = 2

func _on_play_tot_pressed():
	pass


func _on_option_2_pressed():
	option = option +1


func _on_option_3_pressed():
	option = option -1


func _on_option_1_pressed():
	if option == 3:
		get_tree().change_scene_to_file("res://Scenes/How2play.tscn")
	Global.level = 1
	if option == 2:
		pass
	if option == 1:
		pass
	if option == 4:
		get_tree().change_scene_to_file("res://Scenes/Multiplayermunu.tscn")

func _on_exit_2_pressed():
	get_tree().quit()
