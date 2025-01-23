extends CharacterBody2D


var SPEED = 8000.0
var MAX_SPEED = 600.0
var FRICTION = 0.25
var JUMP_VELOCITY = -1000.0
var WALLJUMP_VELOCITY = -700.0
var GRAVITY = 2900.0
var DASH_VELOCITY = 2000
var dashes = 1
var DASH_AMOUNT = 1
var jumps = 1
var JUMP_AMOUNT = 2
var walljumps = 4
var WJUMPS_AMOUNT = 4

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_on_floor():
		dashes = DASH_AMOUNT
		jumps = JUMP_AMOUNT
		walljumps = WJUMPS_AMOUNT
	if not is_on_floor():
		
		
		if velocity.y > 0:
			velocity.y += GRAVITY * 1.5 * delta
		else:
			velocity.y += GRAVITY * 0.8 * delta
		
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") && jumps > 0:
		if is_on_wall_only() && walljumps > 0:
			velocity.y = WALLJUMP_VELOCITY
			walljumps -= 1;
		else:	
			velocity.y = JUMP_VELOCITY
			jumps -= 1
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction == 1:
		if velocity.x < MAX_SPEED:
			velocity.x += SPEED * delta;
		
	elif direction == -1:
		if velocity.x > -MAX_SPEED:
			velocity.x -= SPEED * delta;
	else:
		velocity.x *= FRICTION
	if Input.is_action_just_pressed("Dash") && dashes > 0:
		if direction == 1:
			$Dash_Timer.start()
			velocity.x = DASH_VELOCITY
			velocity.y = 0
			dashes -= 1
			
		elif direction == -1:
			velocity.x = -DASH_VELOCITY
			$Dash_Timer.start()
			velocity.y = 0
			dashes -= 1
			
	move_and_slide()

func _on_dash_timer_timeout():
	if abs(velocity.x) > MAX_SPEED:
		velocity.x = 0
