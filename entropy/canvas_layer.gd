extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fade():
	var tween: Tween = create_tween()
	tween.tween_property($ColorRect, "color:a", 1, 1)
