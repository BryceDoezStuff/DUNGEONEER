extends Node



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
var player_health = 3
var mp = false
var money = 0
var Charachter = 1
var Charachter2 = 1
var camera = 1




func _process(delta):
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
