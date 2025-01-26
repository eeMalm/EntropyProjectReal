@tool
extends StaticBody2D

@export var PlatformSprite : CompressedTexture2D
@export var color : Color

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.texture = PlatformSprite
	$Sprite2D.modulate = color
	var collison_shape = $CollisionShape2D
	collison_shape.shape = RectangleShape2D.new()
	if PlatformSprite:
		collison_shape.shape.extents = PlatformSprite.get_size() / 2
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint():
		$Sprite2D.texture = PlatformSprite
		$Sprite2D.modulate = color
