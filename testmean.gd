extends CharacterBody2D



func _on_hitbox_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.name == "Delt":
		$Sprite2D.frame = 212
		await get_tree().create_timer(0.2).timeout
		$Sprite2D.frame = 213
		await get_tree().create_timer(0.5).timeout
		$Sprite2D.frame = 212
