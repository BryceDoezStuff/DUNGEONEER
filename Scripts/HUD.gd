extends Node2D

var animation = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Up_down")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.max_player_health == 3:
		$HealthPoint.show()
		$HealthPoint2.show()
		$HealthPoint3.show()
		$HealthPoint4.hide()
		$HealthPoint5.hide()
		$HealthPoint6.hide()
	if Global.max_player_health == 4:
		$HealthPoint.show()
		$HealthPoint2.show()
		$HealthPoint3.show()
		$HealthPoint4.show()
		$HealthPoint5.hide()
		$HealthPoint6.hide()
	if Global.max_player_health == 5:
		$HealthPoint.show()
		$HealthPoint2.show()
		$HealthPoint3.show()
		$HealthPoint4.show()
		$HealthPoint5.show()
		$HealthPoint6.hide()
	if Global.max_player_health == 6:
		
		$HealthPoint.show()
		$HealthPoint2.show()
		$HealthPoint3.show()
		$HealthPoint4.show()
		$HealthPoint5.show()
		$HealthPoint6.show()
	if Global.player_health == 1:
		$"bobhead".frame = 3
		$HealthPoint.frame = 1
		$HealthPoint2.frame = 0
		$HealthPoint3.frame = 0
		$HealthPoint4.frame = 0
		$HealthPoint5.frame = 0
		$HealthPoint6.frame = 0
	if Global.player_health == 2:
		$"bobhead".frame = 0
		$HealthPoint.frame = 1
		$HealthPoint2.frame = 1
		$HealthPoint3.frame = 0
		$HealthPoint4.frame = 0
		$HealthPoint5.frame = 0
		$HealthPoint6.frame = 0
	if Global.player_health == 3:
		$"bobhead".frame = 0
		$HealthPoint.frame = 1
		$HealthPoint2.frame = 1
		$HealthPoint3.frame = 1
		$HealthPoint4.frame = 0
		$HealthPoint5.frame = 0
		$HealthPoint6.frame = 0
	if Global.player_health == 4:
		$"bobhead".frame = 0
		$HealthPoint.frame = 1
		$HealthPoint2.frame = 1
		$HealthPoint3.frame = 1
		$HealthPoint4.frame = 1
		$HealthPoint5.frame = 0
		$HealthPoint6.frame = 0
	if Global.player_health == 5:
		$"bobhead".frame = 0
		$HealthPoint.frame = 1
		$HealthPoint2.frame = 1
		$HealthPoint3.frame = 1
		$HealthPoint4.frame = 1
		$HealthPoint5.frame = 1
		$HealthPoint6.frame = 0
	if Global.player_health == 6:
		$"bobhead".frame = 0
		$HealthPoint.frame = 1
		$HealthPoint2.frame = 1
		$HealthPoint3.frame = 1
		$HealthPoint4.frame = 1
		$HealthPoint5.frame = 1
		$HealthPoint6.frame = 1
