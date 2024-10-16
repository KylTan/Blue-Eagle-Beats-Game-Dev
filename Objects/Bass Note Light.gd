extends Node2D
var notePosition = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_Position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_Position():
	self.position = Vector2 (0, -notePosition)
