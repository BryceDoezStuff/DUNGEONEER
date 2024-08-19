extends Node2D

var been_here = false
var beem_here_2 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Save.save()
	Global.save = 2
	if Room2.been_here:
		$Player.position = Vector2(89,-70)
	elif Room2.been_here_2:
		$Player.position = Vector2(-160,-70)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.s:
		$Player/Camera2D.enabled = false
	else:
		$Player/Camera2D.enabled = true


func _on_exit_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		Room2.been_here = true
		Room2.been_here_2 = false
		SceneTrans.change_scene_to_file("res://rooms/Firstarea/Secret_Room_1/roomS.tscn")

func _on_exit_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		Room2.been_here = false
		Room2.been_here_2 = true
		SceneTrans.change_scene_to_file("res://rooms/Firstarea/room3/room3.tscn")
