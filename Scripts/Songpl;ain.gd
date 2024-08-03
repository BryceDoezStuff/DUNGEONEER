extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.camera == 2:
		$".".enabled = false
	else:
		$".".enabled = true
	if Global.songplayin == true:
		$"CanvasLayer/Song playing".text = Global.songnamewriter
		$CanvasLayer.show()
	if Global.songplayin == false:
		$"CanvasLayer/Song playing".text = " "
		$CanvasLayer.hide()
	
	if Global.songplayin2 == true:
		Global.songnamewriter = "Now Playin': Order of the leaves | by Grayson Rempel"
		$"CanvasLayer/Song playing".text = Global.songnamewriter
		$CanvasLayer.show()
	if Global.songplayin2 == false:
		$"CanvasLayer/Song playing".text = " "
		$CanvasLayer.hide()
	

