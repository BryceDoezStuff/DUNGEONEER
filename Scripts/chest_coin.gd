extends StaticBody2D

@export var item = 1
@onready var item_image = $coin/Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if item == 1:
		item_image.frame = 1
	elif item == 2:
		item_image.frame = 2
	elif item == 3:
		item_image.frame = 3
	elif item == 4:
		item_image.frame = 4
	elif item == 5:
		item_image.frame = 5
	elif item == 6:
		item_image.frame = 6
	elif item == 7:
		item_image.frame = 7
	elif item == 8:
		item_image.frame = 8
	elif item == 9:
		item_image.frame = 9
	elif item == 10:
		item_image.frame = 10
	elif item == 11:
		item_image.frame = 11
	elif item == 12:
		item_image.frame = 12
	elif item == 13:
		item_image.frame = 13
	elif item == 14:
		item_image.frame = 14
	elif item == 15:
		item_image.frame = 15
	elif item == 16:
		item_image.frame = 16
	elif item == 17:
		item_image.frame = 17
	elif item == 18:
		item_image.frame = 18


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		$coin.queue_free()
		if item == 18:
			Global.player_health += 1
		if item == 17:
			Global.max_player_health += 1
		if item == 16:
			Global.player_health += 2
func _on_area_2d_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		$AnimationPlayer.play("chestopen")
		$Area2D2.queue_free()
