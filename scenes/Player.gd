extends CharacterBody2D

@export var gravity = 600.0
@export var walk_speed = 200
@export var crouch_speed = 100  
@export var jump_speed = -300
@export var max_jumps = 2
@export var dash_speed = 500
@export var dash_duration = 0.4
@export var dash_cooldown = 0.5

var jump_count = 0
var is_crouching = false
var is_dashing = false
var dash_timer = 0
var last_dash_time = -dash_cooldown
var last_direction = 0
var last_input_time = 0

func _physics_process(delta):
	velocity.y += delta * gravity 

	var current_time = Time.get_ticks_msec() / 1000.0  
	var input_direction = 0  

	# Check movement input
	if Input.is_action_just_pressed("ui_left"):  # Detect tap
		if last_direction == -1 and (current_time - last_input_time) < 0.3:
			try_dash(-1)
		last_direction = -1
		last_input_time = current_time
	elif Input.is_action_just_pressed("ui_right"):  # Detect tap
		if last_direction == 1 and (current_time - last_input_time) < 0.3:
			try_dash(1)
		last_direction = 1
		last_input_time = current_time

	# Reset jumps when touching the ground
	if is_on_floor():
		jump_count = 0
		
	# Crouching Logic
	if Input.is_action_pressed("ui_down") and is_on_floor() and not is_dashing:
		is_crouching = true
	else:
		is_crouching = false

	# Double Jump Logic
	if Input.is_action_just_pressed("ui_up") and jump_count < max_jumps and is_dashing != true:
		velocity.y = jump_speed
		jump_count += 1
		$AnimatedSprite2D.play("jump") 

	# Handle Dashing
	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0:
			is_dashing = false  # Stop dashing
	else:
		# Normal Movement (Crouch Speed jika crouching)
		var move_speed = crouch_speed if is_crouching else walk_speed
		if Input.is_action_pressed("ui_left"):
			velocity.x = -move_speed
			$AnimatedSprite2D.flip_h = true
		elif Input.is_action_pressed("ui_right"):
			velocity.x = move_speed
			$AnimatedSprite2D.flip_h = false
		else:
			velocity.x = 0  # Stop movement when no keys are pressed

	# Animation Handling
	if is_dashing:
		$AnimatedSprite2D.play("dash")  # Always prioritize dash animation
	elif is_crouching:
		$AnimatedSprite2D.play("crouch")  # Animasi crouching
	elif is_on_floor():
		if velocity.x == 0:
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("jump")  # Play jump only if not dashing

	move_and_slide()

func try_dash(direction):
	var current_time = Time.get_ticks_msec() / 1000.0
	if (current_time - last_dash_time) > dash_cooldown:  # Check cooldown
		start_dash(direction)

func start_dash(direction):
	is_dashing = true
	dash_timer = dash_duration
	last_dash_time = Time.get_ticks_msec() / 1000.0  # Store last dash time
	velocity.x = direction * dash_speed
		
