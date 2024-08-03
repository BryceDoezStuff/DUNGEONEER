extends CharacterBody2D


func _ready():
	var dateDict = Time.get_date_dict_from_system()
	if dateDict["day"] == 24 and dateDict["month"] == 6:
		print("Ho Ho Ho")


func _process(delta):
	pass
