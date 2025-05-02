extends Node2D
@onready var bassGame = preload("res://Objects/Bass Game.tscn")
#@onready var bassGameTr = preload("res://Objects/Bass Game Training.tscn")
var mapfile = "res://Assets/Audio/Fabilioh.mboy"
var audiofile = "res://Assets/Audio/Fabilioh.mp3"
var callsign = "res://Assets/Callsigns/3 Fights/3 fights w border.png"
var nextDialogueScene = "res://Objects/level_select.tscn"
var nextCheerIndex = GlobalSceneManager.LevelSelect #intercepts what the next cheer index is

var CallsignIndex = 0

func _ready():
	
	match nextCheerIndex:
		1: 
			mapfile = "res://Assets/Audio/Jabba - Bass.mboy"
			audiofile = "res://Assets/Audio/Jabba.mp3"
			CallsignIndex = 6
		2:
			mapfile = "res://Assets/Audio/Fabilioh.mboy"
			audiofile = "res://Assets/Audio/Fabilioh.mp3"
			CallsignIndex = 3
		3:
			mapfile = "res://Assets/Audio/Fly High (Brass+Banda)-Bass.mboy"
			audiofile = "res://Assets/Audio/Fly High (Brass+Banda).mp3"
			CallsignIndex = 4
		4: 
			mapfile = "res://Assets/Audio/Go Ateneo (Brass+Banda)-Bass.mboy"
			audiofile = "res://Assets/Audio/Go Ateneo (BrassAlt+Banda).mp3"		
			CallsignIndex = 5
			
	var instance = preload("res://Objects/Bass Game.tscn").instantiate()
	instance.audiofile = audiofile
	instance.map_file = mapfile
	instance.nextScene = nextDialogueScene
	instance.get_node("MainSign").cheerMode = 1
	instance.get_node("MainSign").cheerIndex = CallsignIndex
	add_child(instance)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
