extends Node2D

var bassNoteHeavy = preload("res://Objects/Bass Note Heavy.tscn")
var bassNoteLight = preload("res://Objects/Bass Note Light.tscn")

var note_data = [
	{
		"pos": 0,
		"len":100
	},
	{
		"pos": 400,
		"len":100
	},
	{
		"pos": 800,
		"len":100
	},
	{
		"pos": 1200,
		"len":100
	}
]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
