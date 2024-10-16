extends Node2D
var notePosition = 0
var is_colliding = 0
var receiver 

# Called when the node enters the scene tree for the first time.
func _ready():
	set_Position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func set_Position():
	self.position = Vector2 (0, -notePosition)


func _on_area_2d_area_entered(area):
	if area.is_in_group("receiver"):
		is_colliding = true
		receiver = area.get_parent()

func _on_area_2d_area_exited(area):
	if area.is_in_group("receiver"):
		is_colliding = false
