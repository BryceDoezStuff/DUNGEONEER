extends Control


@onready var inv: inv = preload("res://Inventory/Inventory(s)/Player_inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()


var is_opened = false


func update_slots():
	for i in range(min(inv.items.size(), slots.size())):
		slots[i].update(inv.items[i])



func _ready():
	close()
	update_slots()


func _process(delta):
	if Input.is_action_just_pressed("e"):
		if is_opened:
			close()
		else:
			open()


func  open():
	visible = true
	is_opened = true
	Engine.time_scale = 0

func close():
	visible = false
	is_opened = false
	Engine.time_scale = 1
