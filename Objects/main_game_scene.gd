extends Node2D
@onready var bassGame = preload("res://Objects/Bass Game.tscn")
var mapfile = "res://Assets/Audio/Vary-Cheer-Bass.mboy"
var audiofile = "res://Assets/Audio/Vary-Cheer.mp3"
var nextDialogueScene = "res://Objects/Timeline_beginning.tscn"
var nextCheerIndex # number corresponds to a cheer
var nextDialogueIndex #number corresponds to a scene hopefully

#func _init():
	#audiofile = "res://Assets/Audio/Fly High (Brass+Banda)-Bass.mboy"
	#mapfile = "res://Assets/Audio/Fly High (Brass+Banda).mp3"
func _ready():
	var instance = bassGame.instantiate()
	instance.audiofile = audiofile
	instance.map_file = mapfile
	instance.nextScene = nextDialogueScene
	
	add_child(instance)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
