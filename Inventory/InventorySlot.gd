extends Panel

@onready var item_spr: Sprite2D = $CenterContainer/Panel/itemSprite


func update(item: InvItem):
	if !item : 
		item_spr.visible = false
	else :
		item_spr.visible = true
		item_spr.texture = item.texture
