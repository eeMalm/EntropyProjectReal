extends CharacterBody2D


var SPEED = 5000.0
var MAX_SPEED = 600.0
var speedmax = 600.0
var FRICTION = 0.25
var JUMP_VELOCITY = -1000.0
var WALLJUMP_VELOCITY = -800.0
var GRAVITY = 2900.0
var DASH_VELOCITY = 2000
var dashes = 1
var DASH_AMOUNT = 1
var jumps = 1
var JUMP_AMOUNT = 1
var walljumps = 10
var WJUMPS_AMOUNT = 10
var isDashing = false

func _physics_process(delta: float) -> void:
	
	var direction := Input.get_axis("ui_left", "ui_right")
	# Add the gravity.
	if is_on_floor():
		dashes = DASH_AMOUNT
		jumps = JUMP_AMOUNT
		walljumps = WJUMPS_AMOUNT
		var Floor = get_floor()
		
		if Floor && "platformvelocity" in Floor:
			if speedmax == MAX_SPEED:
				print("stepped on moving platform")
				velocity = Floor.platformvelocity
				
			speedmax += abs(Floor.platformvelocity.x)
		else:	
			speedmax = MAX_SPEED
	if not is_on_floor():
		
		if velocity.y > 0:
			velocity.y += GRAVITY * 1.3 * delta
		else:
			velocity.y += GRAVITY * 0.8 * delta
			
	if not isDashing:
		# Handle jump.
		if Input.is_action_just_pressed("ui_up"):
			if is_on_wall_only() && walljumps > 0:
				velocity.y = WALLJUMP_VELOCITY
				walljumps -= 1;
				dashes = DASH_AMOUNT
			elif jumps > 0:	
				velocity.y = JUMP_VELOCITY
				jumps -= 1
			
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		
		if direction == 1:
			
			if velocity.x < speedmax:
				velocity.x += SPEED * delta;
		
		elif direction == -1:
			
			if velocity.x > -speedmax:
				velocity.x -= SPEED * delta;
		else:
			velocity.x *= FRICTION
			
	if Input.is_action_just_pressed("Dash") && dashes > 0:
		if direction == 1:
			$Dash_Timer.start()
			isDashing = true
			velocity.x = DASH_VELOCITY
			velocity.y = 0
			dashes -= 1
			
		elif direction == -1:
			isDashing = true
			velocity.x = -DASH_VELOCITY
			$Dash_Timer.start()
			velocity.y = 0
			dashes -= 1
	if(position.y > 1400):
		die()
	move_and_slide()

func _on_dash_timer_timeout():
	isDashing = false
	if abs(velocity.x) > MAX_SPEED:
		velocity.x *= 0.1
		
func die():
	get_tree().quit()

func get_floor() -> Object:
	if is_on_floor():
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if collision.get_collider().is_in_group("Moving Platform"):
				return collision.get_collider()
				
	return null
