extends Node



var talking = false
var max_player_health = 3
var player_health = 1
var vhs = false
var version = 0.5
var save = 2
var modifer_save = 2
var water = false
var facing = null
var boss_cam = false
var direction = 1
var AMMO = 99
var dead_people = 0
var key = false
var modifier = 2
var area = false
var infinite = 999
var signtext = "The glowing orbs you see are called jorbs, They allow you tor reset your double jump mid air
(Press space when touching to reset jumps)"
var signshown = false
var songplayin = false
var songplayin2 = false
var songnamewriter = "Now Playin': Windsheets | by Grayson Rempel"
var level = 0
var songnotmuted = true
var mp = false
var money = 0
var Charachter = 1
var Charachter2 = 1
var camera = 1
var s = false
var spectaotrttoggle = 0


func _process(delta):
	if player_health > max_player_health:
		player_health = max_player_health
	if Input.is_action_just_pressed("Spectator"):
		spectaotrttoggle += 1
		if spectaotrttoggle > 1:
			spectaotrttoggle = 0
	if spectaotrttoggle == 1:
		s = true
	elif spectaotrttoggle == 0:
		s = false
	print("THE THING", save)
	print("Money", money)
	if AMMO > 99:
		AMMO = 99
	if camera > 2:
		camera = 1
	print(modifier)
	print(level)
	if player_health < 1:
		Global.player_health = Global.player_health +3
		get_tree().reload_current_scene()
func _ready():
	if level == 1:
		get_tree().change_scene_to_file("res://Scenes/Level1.tscn")
	if level == 2:
		get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
	if level == 3:
		get_tree().change_scene_to_file("res://Scenes/Lavel3.tscn") 
