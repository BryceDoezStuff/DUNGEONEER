extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $TextEdit.text == "1":
		SceneTrans.change_scene_to_file("res://rooms/Firstarea/room1/room1.tscn")
	if $TextEdit.text == "2":
		SceneTrans.change_scene_to_file("res://rooms/Firstarea/room2/room2.tscn")
	if $TextEdit.text == "3":
		SceneTrans.change_scene_to_file("res://rooms/Firstarea/room3/room3.tscn")
