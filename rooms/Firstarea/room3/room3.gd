extends Node2D

var been_here = false
var beem_here_2 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Save.save()
	Global.save = 3
	if Room3.been_here:
		$Player.position = Vector2(0,0)
	elif Room3.been_here_2:
		$Player.position = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		Room3.been_here = true
		Room3.been_here_2 = false
		SceneTrans.change_scene_to_file("res://rooms/Firstarea/Secret_Room_2/roomS2.tscn")

func _on_exit_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		Room3.been_here = false
		Room3.been_here_2 = true
		SceneTrans.change_scene_to_file("res://rooms/Firstarea/room3/room3.tscn")


func _on_enter_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		SceneTrans.change_scene_to_file("res://rooms/Firstarea/room2/room2.tscn")
