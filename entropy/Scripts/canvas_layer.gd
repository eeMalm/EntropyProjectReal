extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func fade():
	var tween: Tween = create_tween()
	tween.tween_property($"Fade-Dark", "color:a", 1, 0.5)
	await tween.finished
	var tween2 = create_tween()
	
	tween2.tween_property($"GameOver", "modulate:a", 1, 3)
	await tween2.finished
	get_parent().get_node("Player").spawn()
	
	# Right now the commented out code is quite broken, im working on it tho.
	
	#while !Input.is_anything_pressed():
		#await get_tree().process_frame
	#print("key pressed")
	#var tween3 = create_tween()
	#tween3.tween_property($"GameOver", "modulate:a", 0, 0.5)
	#await tween3.finished
	#var tween4 = create_tween()
	#tween.tween_property($"Fade-Dark", "color:a", 0, 1)
	
	
	
