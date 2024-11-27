extends Area2D
var isCorrect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_sliding_scale_area_entered(area):
	isCorrect = true # Replace with function body.
	print("Hitting Green Area 1")

func _on_sliding_scale_area_exited(area):
	isCorrect = false # Replace with function body.
	print("Hitting Red Area 1")

func _on_sliding_scale_2_area_entered(area):
	isCorrect = true # Replace with function body.
	print("Hitting Green Area 2")

func _on_sliding_scale_2_area_exited(area):
	isCorrect = false # Replace with function body.
	print("Hitting Red Area 2")

func _on_sliding_scale_3_area_entered(area):
	isCorrect = true # Replace with function body.
	print("Hitting Green Area 3")

func _on_sliding_scale_3_area_exited(area):
	isCorrect = false # Replace with function body.
	print("Hitting Red Area 3")
	
func _isHit():
	return isCorrect
