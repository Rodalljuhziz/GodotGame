extends Control

var is_open = false

@onready var inv: Inventory = preload("res://Inventory/playerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()


func _ready():
	update_Slot()
	close()


func update_Slot():
	for i in range(min(inv.items.size(), slots.size())): 
		slots[i].update(inv.items[i])
		
func _process(delta): 
	if Input.is_action_just_pressed("I"):
		if is_open:
			close()
		else:
			open()

#
func open():
	visible = true
	is_open = true
#

func close():
	visible = false
	is_open = false
