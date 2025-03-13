#Global Variable For calling function to Change Scenes (needs to be global for dialogic to detect)
extends Node

#Into the non-dialogue scenes
func _changeScene_main_game_Bass():
	get_tree().change_scene_to_file("res://Objects/main_game_scene.tscn")

func _changeScene_main_game_Snare():
	get_tree().change_scene_to_file("res://Objects/main_game_scene_snare.tscn")

func _changeScene_exit_game():
	get_tree().quit()

func _changeScene_MainMenu():
	get_tree().change_scene_to_file("res://Objects/main_menu.tscn")

func _changeScene_LevelSelect():
	get_tree().change_scene_to_file("res://Objects/level_select.tscn")

#Scenes for Minigames Timelines (into the dialogs)

func _changeScene_minigame_drumSeeping():
	get_tree().change_scene_to_file("res://Objects/Minigames/DrumSeeping/MG-Drum-Seeping.tscn")

func _changeScene_minigame_drumScrewing():
	get_tree().change_scene_to_file("res://Objects/Minigames/DrumScrew/Minigame-DrumScrew-Demo.tscn")

func _changeScene_minigame_stickTaping():
	get_tree().change_scene_to_file("res://Objects/Minigames/StickTape/MG-Stick-Tape.tscn")
	
func _changeScene_minigame_equipmentLoading():
	get_tree().change_scene_to_file("res://Objects/Minigames/CarryEquipment/MG-Carry-Equipment.tscn")

#Scenes for Trivia (into the dialogs)
# order is based from figma order
func _changeScene_trivia_1920s(): #first trivia, first minigame (bass)
	get_tree().change_scene_to_file("res://Objects/Trivia_Scenes/trivia_scene_1920s.tscn")

func _changeScene_trivia_diff_units(): #second trivia, second minigame (bass)
	get_tree().change_scene_to_file("res://Objects/Trivia_Scenes/trivia_scene_1920s.tscn")

func _changeScene_trivia_blue_gibberish(): #third trivia, third minigame (bass)
	get_tree().change_scene_to_file("res://Objects/Trivia_Scenes/trivia_scene_1920s.tscn")

func _changeScene_trivia_dancers(): #fourth trivia, fourth minigame (bass)
	get_tree().change_scene_to_file("res://Objects/Trivia_Scenes/trivia_scene_1920s.tscn")

func _changeScene_trivia_events(): #fifth trivia, second minigame (snare)
	get_tree().change_scene_to_file("res://Objects/Trivia_Scenes/trivia_scene_1920s.tscn")

func _changeScene_trivia_introduced(): #sixth trivia, third minigame (snare)
	get_tree().change_scene_to_file("res://Objects/Trivia_Scenes/trivia_scene_1920s.tscn")

#Scenes for Dialogic Timelines (into the dialogs)

#BASS LEVELS
#level 1
func _changeScene_Timeline_pre_training():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_pre_training.tscn")

func _changeScene_Timeline_post_training():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_post_training.tscn")

func _changeScene_Timeline_post_maintenance():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_post_maintenance.tscn")

#level 2
func _changeScene_Timeline_pre_basketball_game():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_pre_basketball_game.tscn")

func _changeScene_Timeline_1sthalf_basketball_game():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_1sthalf_basketball_game.tscn")

func _changeScene_Timeline_2ndhalf_basketball_game():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_2ndhalf_basketball_game.tscn")

func _changeScene_Timeline_post_basketball_game():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_post_basketball_game.tscn")

#level 3
func _changeScene_Timeline_bass_Mission3():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_bass_game_3.tscn")

func _changeScene_Timeline_bass_Mission3_pre_finals():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_bass_game_3_pre_finals.tscn")

func _changeScene_Timeline_bass_Mission3_1sthalf():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_bass_game_3_1_sthalf.tscn")

func _changeScene_Timeline_bass_Mission3_2ndhalf():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_bass_game_3_2_ndhalf.tscn")

func _changeScene_Timeline_bass_Mission3_post_finals():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_bass_game_3_post_finals.tscn")

#SNARE LEVELS
#level 1
func _changeScene_Timeline_snare_tutorial():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snare_tutorial.tscn")

func _changeScene_Timeline_snare_post_training():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snare_post_training.tscn")

func _changeScene_Timeline_snare_post_maintenance():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snare_post_maintenance_1.tscn")

#level 2
func _changeScene_Timeline_snare_pre_bball():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snare_pre_bball.tscn")

func _changeScene_Timeline_snare_1sthalf_bball():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snare_1sthalf_bball.tscn")

func _changeScene_Timeline_snare_2ndhalf_baball():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snare_2ndhalf_bball.tscn")

func _changeScene_Timeline_snare_post_bball():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snare_post_bball.tscn")

#level 3
func _changeScene_Timeline_snare_Mission3():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snaregame_3.tscn")

func _changeScene_Timeline_snare_Mission3_pre_finals():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snaregame_3_pre_finals.tscn")

func _changeScene_Timeline_snare_Mission3_1sthalf():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snaregame_3_1sthalf.tscn")

func _changeScene_Timeline_snare_Mission3_2ndhalf():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snaregame_3_2ndhalf.tscn")

func _changeScene_Timeline_snare_Mission3_post_finals():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snaregame_3_post_finals.tscn")
