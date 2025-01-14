extends Node2D
var is_Hit = false #activates hit window to "eat" notes
var is_pressed = false
var noteDir #1 L, 2 R, etc.
var total_hits = 0
var particle = preload("res://Objects/particle_explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 

# receiever may not actually know when a beat is hit, only "activates" the window to "eat" notes
func _input(event):
	# particle effect for hits
	var particleChild = particle.instantiate()
	particleChild.position = Vector2(149, 43)
	particleChild.emitting = true
	
	if event.is_action_pressed("D_key"):
		is_pressed = true
		is_Hit = true
		noteDir = 1
		add_child(particleChild)
	elif event.is_action_pressed("K_key"):
		is_pressed = true
		is_Hit = true
		noteDir = 2
		add_child(particleChild)
	elif event.is_action_pressed("space_key"):
		is_pressed = true
		is_Hit = true
		noteDir = 3
		add_child(particleChild)
	else: 
		is_pressed = false
		is_Hit = false
		noteDir = 0

