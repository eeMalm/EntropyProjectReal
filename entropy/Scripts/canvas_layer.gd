extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func fade():
	var tween: Tween = create_tween()
	tween.tween_property($"Fade-Dark", "color:a", 1, 0.5)
	await tween.finished
	tween.stop()
	var tween2 = create_tween()
	
	tween2.tween_property($"GameOver", "modulate:a", 1, 2)
	await tween2.finished
	tween.stop()
	get_parent().get_node("Player").spawn()
	$RespawnTimer.start()	


	
	
	


func _on_respawn_timer_timeout() -> void:
	$"Fade-Dark".modulate = Color(1, 1, 1, 0)
	$"GameOver".modulate = Color(1, 1, 1, 0)
