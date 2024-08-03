extends StaticBody2D

@export var item = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if item == 1:
		if body is Player:
			Global.money = Global.money +1
			$coin.queue_free()
			

	if item == 2:
		if body is Player:
			Global.money = Global.money +5
			$"x5 coins".queue_free()
	if item == 3:
		if body is Player:
			Global.modifier = Global.modifier + 1
			$Modifier.queue_free()


func _on_area_2d_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		if item == 1:
			$Modifier.queue_free()
			$"x5 coins".queue_free()
			$AnimationPlayer.play("chestopen")
			$Area2D2.queue_free()
		elif item == 2:
			$Modifier.queue_free()
			$coin.queue_free()
			$AnimationPlayer.play("chestopenx5")
			$Area2D2.queue_free()
		elif item == 3:
			$"x5 coins".queue_free()
			$coin.queue_free()
			$AnimationPlayer.play("chestopenmodifer")
			$Area2D2.queue_free()



