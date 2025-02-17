extends Node2D
@onready var snareGame = preload("res://Objects/Snare Game.tscn")
var mapfile = "res://Assets/Audio/3-Fights-Cheer-Snare.mboy"
var audiofile = "res://Assets/Audio/3Fights-Cheer.mp3"

var nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_pre_training.tscn"
var nextCheerIndex = 1 #intercepts what the next cheer index is
var nextDialogueIndex = 1  #number corresponds to a scene 


# Called when the node enters the scene tree for the first time.
func _ready():
	
	if nextCheerIndex:
		nextCheerIndex = Dialogic.VAR.Song_played_snare #intercepts what the next cheer index is
	if nextDialogueIndex:
		nextDialogueIndex = Dialogic.VAR.Dialogue_name_snare #number corresponds to a scene hopefully

	match nextCheerIndex:
		1: #first training
			mapfile = "res://Assets/Audio/Otso-Cheer-Snare.mboy"
			audiofile = "res://Assets/Audio/Otso-Cheer.mp3"
	
	match nextDialogueIndex:
		1: #first training arc
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snare_post_training.tscn" # 2nd dialog
		2: #first training arc
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snare_post_maintanance_1.tscn"
			
	var instance = snareGame.instantiate()
	instance.audiofile = audiofile
	instance.map_file = mapfile
	instance.nextScene = nextDialogueScene 
	add_child(instance)
