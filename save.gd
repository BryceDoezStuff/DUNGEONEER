extends Node

# Let's assume the PlayerNode is the node where we save the player data in game

var save_path := "user://player_data.dat" # <- custom format

func _process(delta):
	if Input.is_action_just_pressed("Save"):
		save()
	if Input.is_action_just_pressed("Load"):
		_load()


func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_32(Global.save)
	file.close()
  

func _load():
	var file = FileAccess.open(save_path, FileAccess.READ)
	Global.save = file.get_32()
	file.close()
