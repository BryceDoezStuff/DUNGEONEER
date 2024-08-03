extends CharacterBody2D

func key():
	if Global.key:
		$AnimationPlayer.play("Door")
