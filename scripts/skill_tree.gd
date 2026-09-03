extends CanvasLayer

class_name SkillTree 
# Called when the node enters the scene tree for the first time.

@onready var sk_tree = $"../SkillTree"

@onready var state_pause = $"../"

@onready var pauseMenu_screen = $"../pause_menu"

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("coucou : ", pauseMenu_screen)
	pass


func _on_sortie_skill_tree_pressed() -> void:
	#todo : Corriger le soucis présent : Quand on est sur la scène de jeu, le menu de pause n'existe "pas"
	if  state_pause.game_paused : 
		sk_tree.visible = false
		pauseMenu_screen.visible = true
	else :
		sk_tree.visible = false
	pass # Replace with function body.
