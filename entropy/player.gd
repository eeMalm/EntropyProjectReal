extends CharacterBody2D


const SPEED = 13000.0
var MAX_SPEED = 500.0
var FRICTION = 0.25
const JUMP_VELOCITY = -800.0
var gravity = 1900.0
const DASH_VELOCITY = 700


func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	if not is_on_floor():
		
		
		if velocity.y > 0:
			velocity.y += gravity * 1.3 * delta
		else:
			velocity.y += gravity * 0.7 * delta
		
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	print(direction)
	if direction == 1:
		if velocity.x < MAX_SPEED:
			velocity.x += SPEED * delta;
		
	elif direction == -1:
		if velocity.x > -MAX_SPEED:
			velocity.x -= SPEED * delta;
	else:
		velocity.x *= FRICTION
	if Input.is_action_just_pressed("Dash"):
		if direction == 1:
			velocity.x += DASH_VELOCITY
		elif direction == -1:
			velocity.x -= DASH_VELOCITY

	move_and_slide()
