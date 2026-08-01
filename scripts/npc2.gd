extends CharacterBody2D

var name_npc = "slime 2"

func _ready():
	$AnimatedSprite2D.play("idle")
	#position.x = 270
	#position.y = 50

func npc():
	pass
