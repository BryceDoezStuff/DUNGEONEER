extends Marker2D

const BULLET = preload('res://Scenes/arroe.tscn')

func _process(delta):
	
	if Input.is_action_just_pressed("left_mouse") and Global.AMMO > 0: 
		var b = BULLET.instantiate()
		$/root.add_child(b)
		b.transform = global_transform
		Global.AMMO -= 1
		print("Here")
