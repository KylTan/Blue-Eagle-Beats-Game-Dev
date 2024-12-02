extends Node2D
@onready var bassGame = preload("res://Objects/Bass Game.tscn")
var mapfile = "res://Assets/Audio/Vary-Cheer-Bass.mboy"
var audiofile = "res://Assets/Audio/Vary-Cheer.mp3"
var nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_pre_training.tscn"
var nextCheerIndex = 1 #intercepts what the next cheer index is
var nextDialogueIndex = 1  #number corresponds to a scene 

#func _init():
	#audiofile = "res://Assets/Audio/Fly High (Brass+Banda)-Bass.mboy"
	#mapfile = "res://Assets/Audio/Fly High (Brass+Banda).mp3"
func _ready():
	
	if nextCheerIndex:
		nextCheerIndex = Dialogic.VAR.Song_played #intercepts what the next cheer index is
	if nextDialogueIndex:
		nextDialogueIndex = Dialogic.VAR.Dialogue_name #number corresponds to a scene hopefully
	
	match nextCheerIndex:
		1: #first training
			mapfile = "res://Assets/Audio/Vary-Cheer-Bass.mboy"
			audiofile = "res://Assets/Audio/Vary-Cheer.mp3"
		2: # first bball 1
			mapfile = "res://Assets/Audio/1 Min Endurance - First Bball Game.mboy"
			audiofile = "res://Assets/Audio/Endurance String 1 minute.mp3"
		3: #first bball 2
			mapfile = "res://Assets/Audio/Go Ateneo Quatro (Brass+Banda)-Bass.mboy"
			audiofile = "res://Assets/Audio/Go Ateneo Quatro with Brass.mp3"
	
	match nextDialogueIndex:
		1: #first training arc
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_post_training.tscn"
		2:
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_post_maintenance.tscn"
		3:
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_1sthalf_basketball_game.tscn"
		4:
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_2ndhalf_basketball_game.tscn"
		5:
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_post_basketball_game.tscn"
		
			
	
	var instance = bassGame.instantiate()
	instance.audiofile = audiofile
	instance.map_file = mapfile
	instance.nextScene = nextDialogueScene
	add_child(instance)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
