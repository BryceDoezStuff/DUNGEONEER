extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
		Global.level = 2
		$Kry/AnimatedSprite2D.play("default")
		if Global.area:
			$Keydoor/AnimationPlayer.play("Door")
			$Thing2.show()
			$Kry.hide()
			$Area2D.hide()
		if not Global.area:
			$Thing2.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(Global.level)
	print(Global.key)
	




func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		Global.player_health = Global.player_health -3
		
		

func _on_area_2d_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/Level2.tscn")


var is_triggered = false
var is_triggered2 = false
var is_triggered3 = false

func _on_pressure_plate_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player" and not is_triggered:
		is_triggered = true
		$"Pressure plate/AnimatedSprite2D".play("Pressed")
		$Area2D/AnimationPlayer.play("Door")
		$AnimatedSprite2D2.show()
		$"Pressure plate/AudioStreamPlayer2D".play()
		$AnimatedSprite2D2.play("Bounce")
		await get_tree().create_timer(0.60).timeout
		$AnimatedSprite2D2.play("idlebounce")
		



func _on_area_2d_234343_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):\
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/Shopkeeper.tscn")




func _on_kry_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player" and not is_triggered3:
		is_triggered3 = true
		$Keydoor/AnimationPlayer.play("Door")
		$Keydoor2/AnimationPlayer.play("Door")
		$Kry.hide()
		$Kry/AudioStreamPlayer2D.play()
		Global.key = true
		$"!!!!Bridfge".show()
		$"!!!!Bridfge".play("Bounce")
		await get_tree().create_timer(0.60).timeout
		$"!!!!Bridfge".play("idlebounce")
		


func _on_level_end_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/Lavel3.tscn")


func _on_level_end_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/Level2.tscn")


func _on_level_startsdoor_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/Level2.tscn")




func _on_startsong_level_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		Global.songplayin2 = true
		$"Startsong level 2/CollisionShape2D".disabled = true



func _on_bosscam_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		Global.boss_cam = true



func _on_bosscam_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		Global.boss_cam = false
