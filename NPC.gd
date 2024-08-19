extends CharacterBody2D


@export var dio : String
var talkable
var talked_too = false



func _process(delta):
	if talkable == true and Input.is_action_just_pressed("e") and !Global.talking:
		Global.talking = true
		Dialogic.start(dio)
		Dialogic.timeline_ended.connect(ended)
	if talkable == true:
		$Label.show()
	else:
		$Label.hide()



"func _ready():
	var new_dialog = Dialogic.start('eric_meateq', false)
	add_child(new_dialog)"


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		talkable = true


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		talkable = false



func ended():
	Dialogic.timeline_ended.disconnect(ended)
	Global.talking = false
