extends Node2D
var is_Hit = false #activates hit window to "eat" notes
var is_pressed = false
var noteDir #1 L, 2 R, etc.

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 

func _input(event):
	if event.is_action_pressed("D_key"):
		is_pressed = true
		is_Hit = true
		noteDir = 1
	elif event.is_action_pressed("K_key"):
		is_pressed = true
		is_Hit = true
		noteDir = 2
	elif event.is_action_pressed("space_key"):
		is_pressed = true
		is_Hit = true
		noteDir = 3
	else: 
		is_pressed = false
		is_Hit = false
		noteDir = 0

