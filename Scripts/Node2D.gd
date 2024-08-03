extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	wait_and_play_animation()


func wait_and_play_animation() -> void:
	await get_tree().create_timer(0.0).timeout
	$AnimatedSprite2D.play("idle")
	wait_and_play_animation()
