extends Control
class_name Diomanager

@onready var charachter_name_ref = $VBoxContainer/PanelContainer/Panel/Charnaem
@onready var test_words_ref = $VBoxContainer/PanelContainer/Panel/Blabber
var name_of_char = "Bryce3434534five"
var words = str("Hello, this is test if this is working correctley")
var set_index = 0


func display_text():
	$Timer.start()

func _process(delta):
	update_character_name()
	


func _on_timer_timeout():
	if set_index < words.length():
		test_words_ref.append_text(words[set_index])
		set_index += 1

func update_character_name():
	if charachter_name_ref != null:
		charachter_name_ref.text = name_of_char
	else:
		print("charachter_name_ref is not initialized correctly.")
