extends CanvasLayer

class_name pause

# penser à faire que le menu de départ lance le chargement vers la scene de jeu
@onready var pause_game_screen = $pause_menu

@onready var options_screen = $options_menu

func _ready():
	pass

func _on_options_pressed() -> void:
	print("J'entre dans les options")
	pause_game_screen.visible = false
	options_screen.visible = true
	pass # Replace with function body.


func _on_retour_pressed() -> void:
	print("Je retourne au menu de pause ")
	pause_game_screen.visible = true
	options_screen.visible = false
	pass # Replace with function body.


func _on_reprendre_pressed() -> void:
	pause_game_screen.visible = false
	pass # Replace with function body.


func _on_inventaire_pressed() -> void:
	pass # Replace with function body.


func _on_skill_tree_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	pass # Replace with function body.
