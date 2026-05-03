extends CharacterBody2D

var speed : float = 30
var player_chase : bool = false
var player : Node2D = null
var health : int  = 100
var player_is_in_attack_zone : bool = false
var is_slime_alive : bool = true

var can_take_damage : bool = true

func _physics_process(delta : float) -> void:
	var animation = $AnimatedSprite2D
	
	deal_with_damage()
	
	if player_chase and player != null:
		var direction : Vector2 = (player.global_position - global_position).normalized()
		position += direction * speed * delta
		move_and_collide(Vector2(0,0)) 

		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				animation.flip_h = false
				animation.play("walk_right")
			else:
				animation.flip_h = true
				animation.play("walk_right")
		else:
			if direction.y > 0:
				animation.play("walk_down")
			else:
				animation.play("walk_up")			
	else:
		animation.play("idle_down")

func _on_detect_player_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true

func _on_detect_player_body_exited(body : Node2D) -> void:
	player = null
	player_chase = false

func enemy() -> void : 
	pass

func _on_enemy_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("player") :
		player_is_in_attack_zone = true

func _on_enemy_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("player") :
		player_is_in_attack_zone = false

func deal_with_damage() -> void :
	if player_is_in_attack_zone and Global.player_current_hit == true :
		if can_take_damage == true:
			health -= 20
			$take_damage_cooldown.start()
			can_take_damage = false
			print("slime health : ", health)
			if health <= 0:
				health = 0
				is_slime_alive = false
				$AnimatedSprite2D.play("death")
				self.queue_free()


func _on_take_damage_cooldown_timeout() -> void:
	can_take_damage = true
