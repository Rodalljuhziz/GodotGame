extends CharacterBody2D

func _ready():
	$AnimatedSprite2D.play("idle")
	position.x = 170
	position.y = 50

func npc():
	pass

#func _physics_process(delta):
#	$AnimatedSprite2D.play("idle");
#	$AnimatedSprite2D.flip_h = true;
