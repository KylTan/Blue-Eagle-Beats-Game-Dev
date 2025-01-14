extends Node2D

@export var line: int

var leftNote = preload("res://Assets/Snare Inner Right.png")

var notePosition
var is_colliding = false
var collected = false
var receiver 


# Called when the node enters the scene tree for the first time.
func _ready():
	set_Position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	collect()

func set_Material():
	$Sprite2D.texture = leftNote
	
func set_Position():
	self.position = Vector2 (0, -notePosition)

func collect(): # takes signal from receiver to know when to delete/hide()
	if !collected:
		if is_colliding and receiver.is_Hit and receiver.noteDir == 2: #if its colliding and can access the receiver
			collected = true
			receiver.is_Hit = false
			receiver.total_hits += 1
			hide()
			
func _on_area_2d_area_entered(area): #if it enters the zone, it gets the parent aka the receiver
	if area.is_in_group("receiver"):
		is_colliding = true
		receiver = area.get_parent()

func _on_area_2d_area_exited(area):
	if area.is_in_group("receiver"):
		is_colliding = false
