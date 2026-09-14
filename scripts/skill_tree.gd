extends CanvasLayer

class_name SkillTree 
# Called when the node enters the scene tree for the first time.

@onready var sk_tree = $"../SkillTree"

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_sortie_skill_tree_pressed() -> void:
	sk_tree.visible = false
