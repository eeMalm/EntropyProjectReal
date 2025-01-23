extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var player_node: Node2D  # Assign the player node in the editor or dynamically

func _physics_process(delta):
	position = position.lerp(get_parent().get_node("Player").position, 2 * delta)
