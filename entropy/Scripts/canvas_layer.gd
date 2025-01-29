extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func fade():
	var tween: Tween = create_tween()
	tween.tween_property($ColorRect, "color:a", 1, 0.5)
