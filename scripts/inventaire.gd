extends CanvasLayer

class_name Inventaire

@onready var inv = $"../Inventaire"

@onready var state_pause = $"../"

@onready var pauseMenu_screen = $"../pause_menu"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_sortie_inventaire_pressed() -> void:
	#todo : Corriger le soucis présent : Quand on est sur la scène de jeu, le menu de pause n'existe "pas"
	if  state_pause.game_paused : 
		inv.visible = false
		pauseMenu_screen.visible = true
	else :
		inv.visible = false
	
