extends CharacterBody2D

var speed : float = 50
var player_chase : bool = false
var player : Node2D = null

func _physics_process(delta : float) -> void:
	var animation = $AnimatedSprite2D
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

func _on_detect_player_body_exited() -> void:
	player = null
	player_chase = false
