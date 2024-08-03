extends Node

func _ready():
	wait_and_play_animation()


func wait_and_play_animation() -> void:
	await get_tree().create_timer(3.0).timeout
	$CharacterBody2D/AnimationPlayer.play("new_animation")
	wait_and_play_animation()


func _on_area_2d_body_entered(body):
	if body.type == "Player":
		get_tree().change_scene_to_file("res://control.tscn")


