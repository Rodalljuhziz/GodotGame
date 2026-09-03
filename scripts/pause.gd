extends CanvasLayer

class_name pause

# penser à faire que le menu de départ lance le chargement vers la scene de jeu
@onready var pause_game_screen = $pause_menu

@onready var options_screen = $options_menu

@onready var inventaire_screen = $Inventaire

@onready var skillTree_screen = $SkillTree 

var game_paused = false

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
	pause_game_screen.visible = false
	inventaire_screen.visible = true
	pass # Replace with function body.


func _on_skill_tree_pressed() -> void:
	pause_game_screen.visible = false
	skillTree_screen.visible = true
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/StartGame.tscn")
	pass # Replace with function body.
