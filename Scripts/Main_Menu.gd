extends Control


@export var option = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Panarama")
	$"Opening up".play("Opening_UP")
	await $"Opening up".animation_finished
	$AnimationPlayer3.play("Jumble")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(option)
	if option > 2:
		option = 1
		print("didit")
	if option < 1:
		option = 2
		print("didit")
	
	if option == 1:
		$PlayButton/OPTIONS.visible = true
	else:
		$PlayButton/OPTIONS.visible = false
	
	if option == 2:
		$PlayButton/HOW2PLAY.visible = true
	else:
		$PlayButton/HOW2PLAY.visible = false
	
	

func _on_play_pressed():
	Save._load()
	$AudioStreamPlayer.play()
	if Global.save == 1:
		get_tree().change_scene_to_file("res://rooms/Firstarea/room1/room1.tscn")
	if Global.save == 2:
		get_tree().change_scene_to_file("res://rooms/Firstarea/room2/room2.tscn")
	if Global.save == 3:
		get_tree().change_scene_to_file("res://rooms/Firstarea/room3/room3.tscn")
	#SceneTrans.change_scene_to_file("res://level_selectbeta.tscn")
	#Global.level = 2

func _on_play_tot_pressed():
	$AudioStreamPlayer.play()
	pass


func _on_option_2_pressed():
	$AudioStreamPlayer.play()
	option = option +1


func _on_option_3_pressed():
	$AudioStreamPlayer.play()
	option = option -1


func _on_option_1_pressed():
	$AudioStreamPlayer.play()
	if option == 2:
		SceneTrans.change_scene_to_file("res://Scenes/How2play.tscn")
	if option == 1:
		SceneTrans.change_scene_to_file("res://options.tscn")

func _on_exit_2_pressed():
	$AudioStreamPlayer.play()
	get_tree().quit()


func _on_creds_pressed():
	$AudioStreamPlayer.play()
	SceneTrans.change_scene_to_file("res://options.tscn")
