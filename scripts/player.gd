extends CharacterBody2D

const speed = 100
var current_direction = "none"
var npc_in_range = false
var already_in_dialogue = false

func _ready():
	$AnimatedSprite2D.play("idle")
	position.x = 50
	position.y = 50
	
func _physics_process(delta):
	
	if npc_in_range == true && !already_in_dialogue:
		if Input.is_action_pressed("ui_accept"):
			already_in_dialogue = true
			DialogueManager.show_dialogue_balloon(load("res://main.dialogue"), "main")
			return

	player_movement(delta)
	
func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_direction = "right"
		play_animation(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_direction = "left"
		play_animation(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_direction = "down"
		play_animation(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_direction = "up"
		play_animation(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func play_animation(movement):
	var direction = current_direction
	var animation = $AnimatedSprite2D
	
	if direction == "right":
		animation.flip_h = false
		if movement == 1:
			animation.play("walk_right")
		elif movement == 0:
			animation.play("idle_right")
	if direction == "left":
		animation.flip_h = true
		if movement == 1:
			animation.play("walk_right")
			#animation.flip_h
		elif movement == 0:
			animation.play("idle_right")
			
	if direction == "down":
		animation.flip_h = false
		if movement == 1:
			animation.play("walk_down")
		elif movement == 0:
			animation.play("idle")
	if direction == "up":
		animation.flip_h = false
		if movement == 1:
			animation.play("walk_up")
		elif movement == 0:
			animation.play("idle_up")


func _on_detect_area_body_entered(body):
	if body.has_method("npc"):
		npc_in_range = true;
		already_in_dialogue = false

func _on_detect_area_body_exited(body):
	if body.has_method("npc"):
		npc_in_range = false
		already_in_dialogue = false
		
