extends CanvasLayer

class_name ui
signal game_started


@onready var end_of_game_screen = $end_of_game
@onready var pause_game_screen = $pause_menu
@onready var start_game_screen = $start_menu

func _ready():
	pass

func on_game_over():
	end_of_game_screen.visible = true
	pause_game_screen.visible = false
	start_game_screen.visible = false
	
func _on_play_button_pressed() -> void:
	game_started.emit()


func _on_game_manager_game_is_starting():
	start_game_screen.visible = false
