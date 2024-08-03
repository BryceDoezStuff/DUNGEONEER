extends AnimatedSprite2D


@export var spring_power: int = 600

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		$".".play("Spring")
		body.velocity.y -= spring_power
	else:
		$".".play("idle")


func _on_spring_2_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	$".".play("idle")

