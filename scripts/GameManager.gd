extends Node
#vidéo tuto ui mis en pause à 23 minutes
signal game_is_starting

@onready var ui = $"../UI" as ui

# Called when the node enters the scene tree for the first time.
func _ready():
	#ui.game_started.connect(game_started)
	pass


func game_started():
	emit_signal("game_is_starting")

func end_game():
	ui.on_game_over()
