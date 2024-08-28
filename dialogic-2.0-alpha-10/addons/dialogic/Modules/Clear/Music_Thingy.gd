extends Node2D


func play_music():
	$AnimationPlayer.play("Bump")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("Head bob")



# Called when the node enters the scene tree for the first time.
func _ready():
	play_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
