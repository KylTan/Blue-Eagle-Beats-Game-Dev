extends Node2D
var beaterSprite
var chargeValue	
var NoteRecLight
var NoteRecHeavy

func _ready():
	beaterSprite = get_node("BeaterSprite") #beater
	NoteRecLight = get_node("Note Receiver Light")
	NoteRecHeavy = get_node("Note Receiver Heavy")

func _process(delta):
	followMouse()
	
	
func followMouse():
	# beater following mouse
	var mouse_pos = get_local_mouse_position()
	beaterSprite.position = mouse_pos
	print(mouse_pos)

#Value of Bass charge (aka what note type)
func _on_heavy_charge_zone_mouse_entered():
	chargeValue = 2
	#trigger note receiver action
	
func _on_light_charge_zone_mouse_entered():
	chargeValue = 1
	#trigger note receiver action
	
# going to this zone counts the hit with corresponding charge
func _on_clear_area_mouse_entered():
	chargeValue = 0
