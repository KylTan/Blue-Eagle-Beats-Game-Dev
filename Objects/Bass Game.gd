extends Node2D
var beaterSprite
var chargeValue	
var NoteRecLight
var NoteRecHeavy
var is_Hit = false

#bar spawning variables
var bar_scn = preload("res://Objects/Bar.tscn")
var barList = []
@onready var bars_node = $Bar #was called Barsnode
var bar_Length_In_M = 1080 # 1080 cuz we using 2d pixels not 3d scaling
var curr_location = Vector2(0, -bar_Length_In_M)	
var speed = Vector2(0,300)
		
	
func _ready():
	beaterSprite = get_node("BeaterSprite") #beater
	NoteRecLight = get_node("Note Receiver Light")
	NoteRecHeavy = get_node("Note Receiver Heavy")
	
	# bar spawning on ready
	for i in range(3):
		add_bar()
		
		
func _process(delta):
	followMouse()
	bars_node.translate(speed*delta)
	
	for bar in barList:
		if (bar.position.y + bars_node.position.y)/2 >= bar_Length_In_M:
			remove_bar(bar)
			add_bar()
			
# ~~~~~Bass game functions~~~~~
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
	
# going to this zone counts the hit with corresponding charge a.k.a the input
func _on_clear_area_mouse_entered():
	is_Hit = true
	chargeValue = 0

func _on_clear_area_mouse_exited():
	is_Hit = false
	
# ~~~~~Bar spawning functions~~~~~
func add_bar():
	var bar = bar_scn.instantiate()
	bar.position = curr_location
	barList.append(bar)
	bars_node.add_child(bar)
	curr_location += Vector2(0, -bar_Length_In_M)	

func remove_bar(bar):
	bar.queue_free()
	barList.erase(bar)



