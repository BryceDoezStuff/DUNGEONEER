extends Control

var stock_dj = 1
var stock_sp = 1
var stock_hj = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	wait_and_play_animation()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(Global.modifier)
	if stock_dj <0:
		stock_dj = stock_dj + 1


func wait_and_play_animation():
	await get_tree().create_timer(0.0).timeout
	$AnimatedSprite2D.play("Blink")
	wait_and_play_animation()


func _on_texture_button_pressed():
	print("Sigma")
	if Global.money > 1:
		if stock_dj < 1:
			$TextureButton/AnimationPlayer.play("Sold out")
			pass
		else:
			Global.money = Global.money -1
			Global.modifier = Global.modifier + 1
			stock_dj = stock_dj -1
		


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
