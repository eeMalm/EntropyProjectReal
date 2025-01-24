extends StaticBody2D

@export var startpos: Vector2
@export var targetpos: Vector2
@export var interval: int

var prev_position: Vector2
var velocity: Vector2

func _ready():
	prev_position = position
	run()

func _process(delta):
	velocity = (position - prev_position) / delta  # Calculate platform velocity
	prev_position = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func run():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", startpos, interval)
	tween.tween_property(self, "position", targetpos, interval)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.connect("finished", Callable(self, "run"))
	
