extends CharacterBody2D

const speed : float = 100
var current_direction : String = "none"
var is_attacking : bool = false

func _physics_process(delta : float):
	player_movement(delta)

func player_movement(delta : float):
	if Input.is_action_pressed("ui_right"):
		current_direction = "right"
		play_movement(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_direction = "left"
		play_movement(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_direction = "down"
		play_movement(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_direction = "up"
		play_movement(1)
		velocity.x = 0
		velocity.y = -speed
	elif Input.is_action_pressed("hit"):
		play_attack()
		velocity.x = 0
		velocity.y = 0
	elif Input.is_action_pressed("interaction"):
		play_interaction()
	else:
		play_movement(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()

func play_movement(movement : int):
	var animation = $AnimatedSprite2D

	if current_direction == "right":
		animation.flip_h = false
		if movement == 1:
			animation.play("walk_right")
		elif movement == 0:
			animation.play("idle_right")
	if current_direction == "left":
		animation.flip_h = true
		if movement == 1:
			animation.play("walk_right")
		elif movement == 0:
			animation.play("idle_right")

	if current_direction == "down":
		animation.flip_h = false
		if movement == 1:
			animation.play("walk_down")
		elif movement == 0:
			animation.play("idle_down")
	if current_direction == "up":
		animation.flip_h = false
		if movement == 1:
			animation.play("walk_up")
		elif movement == 0:
			animation.play("idle_up")

func play_attack():
	is_attacking = true
	var animation = $AnimatedSprite2D

	if current_direction == "right":
		animation.flip_h = false
		animation.play("attack_right")
	if current_direction == "left":
		animation.flip_h = true
		animation.play("attack_right")
	if current_direction == "down":
		animation.flip_h = false
		animation.play("attack_down")
	if current_direction == "up":
		animation.flip_h = false
		animation.play("attack_up")

func play_interaction():
	var anmation = $AnimatedSprite2D
	#	TODO
