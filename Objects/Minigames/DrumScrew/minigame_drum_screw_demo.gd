extends Node2D

var screwTotal #total screws in scene
var nextDialogueIndex = Dialogic.VAR.Dialogue_name 
var nextDialogueScene

var cursor = preload("res://Assets/DrumScrewMinigame/MG_Screw_RatchetKey.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor, Input.CURSOR_ARROW, Vector2(75,90))
	screwTotal = 4
	
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if screwTotal <= 0:
		Input.set_custom_mouse_cursor(null, Input.CURSOR_ARROW)
		get_tree().change_scene_to_file(nextDialogueScene)	
	
