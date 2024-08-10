extends Node2D

@onready var item_image = $Sprite2D
var item

# Called when the node enters the scene tree for the first time.
func _ready():
	if item == 1:
		item_image.frame = 22
	else:
		item_image.frame = 6

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
