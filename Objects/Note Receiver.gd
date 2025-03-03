extends Node2D
var is_Hit = false #activates hit window to "eat" notes
var is_Entered = false
var note_Charge = 0
var total_hits = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 


func _on_area_2d_area_entered(area):
	is_Entered = true

func _on_area_2d_area_exited(area):
	is_Entered = false
