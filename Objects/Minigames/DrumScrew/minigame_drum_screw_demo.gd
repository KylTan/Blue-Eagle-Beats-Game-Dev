extends Node2D

var screwTotal #total screws in scene
var nextDialogueIndex = 1
var nextDialogueScene

var cursor = preload("res://Assets/DrumScrewMinigame/MG_Screw_RatchetKey.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor, Input.CURSOR_ARROW, Vector2(75,90))
	screwTotal = 4

	if nextDialogueIndex: # CHECK FOR SCREW GAME TO DIFF BETWEEN BASS TICKS AND SNARE TICKS
		if Dialogic.VAR.Dialogue_name > 0:
			nextDialogueIndex = Dialogic.VAR.Dialogue_name #number corresponds to a scene hopefully
			match nextDialogueIndex:
				# Bass
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
			
		elif Dialogic.VAR.Dialogue_name_snare > 0:
			nextDialogueIndex = Dialogic.VAR.Dialogue_name_snare #number corresponds to a scene hopefully
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
# put a cooler ending here
func _process(delta: float) -> void:
	if screwTotal <= 0:
		Input.set_custom_mouse_cursor(null, Input.CURSOR_ARROW)
		get_tree().change_scene_to_file(nextDialogueScene)	
	
