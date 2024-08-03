extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.area = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(Global.key)
	pass




func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		get_tree().reload_current_scene()


func _on_area_2d_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/Level2.tscn")


var is_triggered = false
var is_triggered2 = false
var is_triggered3 = false



func _on_kry_body_shape_entered(body_rid, body, body_shape_index, local_shape_index) -> void:
	if body.name == "Player" and not is_triggered3:
		is_triggered3 = true
		$jumpmod.queue_free()
		$jumpmod/AudioStreamPlayer2D.play()
		Global.modifier = Global.modifier + 1
