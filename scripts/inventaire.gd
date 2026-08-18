extends CanvasLayer

class_name Inventaire

@onready var inv = $"../"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_sortie_inventaire_pressed() -> void:
	inv.visible = false
	pass # Replace with function body.
