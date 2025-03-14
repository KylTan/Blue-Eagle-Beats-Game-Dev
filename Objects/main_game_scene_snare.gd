extends Node2D
@onready var snareGame = preload("res://Objects/Snare Game.tscn")
@onready var snareGameTr = preload("res://Objects/Snare Game Training.tscn")
var mapfile = "res://Assets/Audio/Go Ateneo-Snare 2.0.mboy"
var audiofile = "res://Assets/Audio/Go Ateneo (BrassAlt+Banda).mp3"

var nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_pre_training.tscn"
var nextCheerIndex = 1 #intercepts what the next cheer index is
var nextDialogueIndex = 1  #number corresponds to a scene 


# Called when the node enters the scene tree for the first time.
func _ready():
	
	if nextCheerIndex:
		nextCheerIndex = Dialogic.VAR.Song_played_snare #intercepts what the next cheer index is
	if nextDialogueIndex:
		nextDialogueIndex = Dialogic.VAR.Dialogue_name_snare #number corresponds to a scene hopefully
	
	if nextCheerIndex:
		match nextCheerIndex:
			1: #first training
				mapfile = "res://Assets/Audio/Endurance Training Snare.mboy"
				audiofile = "res://Assets/Audio/Endurance Training.mp3"
			2: #first bball - endurance
				mapfile = "res://Assets/Audio/1 Min Endurance - First Bball Game Snare.mboy"
				audiofile = "res://Assets/Audio/Endurance String 1 minute.mp3"
			3: #first bball - halftime cheer
				mapfile = "res://Assets/Audio/3-Fights-Cheer-Snare.mboy"
				audiofile = "res://Assets/Audio/3Fights.mp3"
			4: # Finals - Pre game
				mapfile = "res://Assets/Audio/Manson-Snare.mboy"
				audiofile = "res://Assets/Audio/Manson.mp3"
			5: 
				mapfile = "res://Assets/Audio/Go Ateneo-Snare 2.0.mboy" #REPLACE WIT GO ATENEO
				audiofile = "res://Assets/Audio/Go Ateneo (BrassAlt+Banda).mp3"
		
		match nextDialogueIndex:
			1: #first training arc
				nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snare_post_training.tscn" # 2nd dialog
			2: #first training arc
				nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snare_post_maintanance_1.tscn"
			#3: # first bball - pre bball - omitted since its a mission start thing
				#nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snare_pre_bball.tscn"
			3: # first bball - 1st half
				nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snare_1sthalf_bball.tscn"
			4: # first bball - 2nd half
				nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snare_2ndhalf_bball.tscn"
			5: # first bball - post bball
				nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snare_post_bball.tscn"
				# start with finals 3 
			6:  # finals pre
				nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snaregame_3_pre_finals.tscn"
			7: # finals 1st
				nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snaregame_3_1sthalf.tscn"
			8: # finals 2nd
				nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snaregame_3_2ndhalf.tscn"
			9: # finals 3rd
				nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snaregame_3_post_finals.tscn"
			
	var instance = snareGame.instantiate()
			
	if nextCheerIndex == 1:
		instance = snareGameTr.instantiate()
		
	instance.audiofile = audiofile
	instance.map_file = mapfile
	instance.nextScene = nextDialogueScene 
	add_child(instance)
