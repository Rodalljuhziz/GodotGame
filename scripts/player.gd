extends CharacterBody2D

const speed : float = 100
var current_direction : String = "none"
var is_attacking : bool = false

var enemy_is_in_attack_range : bool = false
var enemy_attack_cooldown : bool = true
var health : int = 100
var is_player_alive : bool = true

var hit_in_progress : bool = false
var can_take_damage : bool = true

func _physics_process(delta : float) -> void:
	player_movement(delta)
	enemy_attack()
	hit()
	
	if health <= 0 : 
		death()

func player_movement(delta : float) -> void:
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
	elif Input.is_action_pressed("interaction"):
		play_interaction()
	else:
		play_movement(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()

func play_movement(movement : int) -> void :
	var animation = $AnimatedSprite2D

	if current_direction == "right":
		animation.flip_h = false
		if movement == 1:
			animation.play("walk_right")
		elif movement == 0:
			if hit_in_progress == false :
				animation.play("idle_right")
	if current_direction == "left":
		animation.flip_h = true
		if movement == 1:
			animation.play("walk_right")
		elif movement == 0:
			if hit_in_progress == false :
				animation.play("idle_right")

	if current_direction == "down":
		animation.flip_h = false
		if movement == 1:
			animation.play("walk_down")
		elif movement == 0:
			if hit_in_progress == false :
				animation.play("idle_down")
	if current_direction == "up":
		animation.flip_h = false
		if movement == 1:
			animation.play("walk_up")
		elif movement == 0:
			if hit_in_progress == false :
				animation.play("idle_up")

#function for interact with e key
func play_interaction() -> void :
	var anmation = $AnimatedSprite2D
	#	TODO


func _on_player_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("enemy") :
		enemy_is_in_attack_range = true


func _on_player_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("enemy") : 
		enemy_is_in_attack_range = false

func enemy_attack() -> void :
	if enemy_is_in_attack_range and enemy_attack_cooldown == true:
		if can_take_damage == true:
			health -= 20 
			enemy_attack_cooldown = false
			$attack_cooldown.start()
			$take_damage_cooldown.start()
			can_take_damage = false
			print("Remaining health : ", health)

func player() -> void:
	pass

func _on_attack_cooldown_timeout() -> void:
	enemy_attack_cooldown = true

func hit() -> void :
	var direction = current_direction
	if Input.is_action_just_pressed("hit") :
		Global.player_current_hit = true
		hit_in_progress = true
		if direction == "right" : 
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("attack_right")
			$hit_duration_animation.start()
		elif direction == "left" : 
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("attack_right")
			$hit_duration_animation.start()
		elif direction == "down" : 
			$AnimatedSprite2D.play("attack_down")
			$hit_duration_animation.start()
		elif direction == "up" : 
			$AnimatedSprite2D.play("attack_up")
			$hit_duration_animation.start()

func _on_hit_duration_animation_timeout() -> void:
	$hit_duration_animation.stop()
	Global.player_current_hit = false
	hit_in_progress = false
	
func death() -> void: # not fully implemented
	is_player_alive = false #dead player
	health = 0
	print("you are dead")
	$AnimatedSprite2D.play("death")
	$death_duration_animation.start()
	self.queue_free()


func _on_take_damage_cooldown_timeout() -> void:
	can_take_damage = true
