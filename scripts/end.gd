extends CanvasLayer

class_name end
signal game_started

# penser à faire que le menu de départ lance le chargement vers la scene de jeu
@onready var start_game_screen = $start_menu
@onready var options_screen = $options_menu

@onready var game_title = $start_menu/TitleGame
@onready var playButton = $start_menu/PlayButton
@onready var optionButton = $start_menu/Options
@onready var exit_button = $start_menu/Exit

func _ready():
	pass

	
func _on_play_button_pressed() -> void:
	start_game_screen.visible = false
	print("début du jeu")
	game_started.emit()
	get_tree().change_scene_to_file("res://scenes/Tuto.tscn")
	
func _on_game_manager_game_is_starting():
	start_game_screen.visible = false

func _on_exit_pressed() -> void:
	print("Je sors du jeu")
	pass # Replace with function body.


func _on_options_pressed() -> void:
	print("J'entre dans les options")
	start_game_screen.visible = false
	options_screen.visible = true
	pass # Replace with function body.


func _on_retour_pressed() -> void:
	print("Je retourne au menu principal ")
	start_game_screen.visible = true
	options_screen.visible = false
	pass # Replace with function body.
