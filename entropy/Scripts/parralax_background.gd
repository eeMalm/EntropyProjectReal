extends ParallaxBackground

@export var BackgroundColor : Color

# Called when the node enters the scene tree for the first time.
func _ready():
	$ParallaxLayer.modulate = BackgroundColor
	$ParallaxLayer2.modulate = BackgroundColor


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
