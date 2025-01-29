#Global Variable For calling function to Change Scenes (needs to be global for dialogic to detect)
extends Node

#Into the non-dialogue scenes
func _changeScene_main_game_Bass():
	get_tree().change_scene_to_file("res://Objects/main_game_scene.tscn")

func _changeScene_main_game_Snare():
	get_tree().change_scene_to_file("res://Objects/Snare Game.tscn")

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


#Scenes for Dialogic Timelines (into the dialogs)

func _changeScene_Timeline_pre_training():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_pre_training.tscn")

func _changeScene_Timeline_post_training():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_post_training.tscn")

func _changeScene_Timeline_post_maintenance():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_post_maintenance.tscn")

func _changeScene_Timeline_pre_basketball_game():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_pre_basketball_game.tscn")

func _changeScene_Timeline_1sthalf_basketball_game():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_1sthalf_basketball_game.tscn")

func _changeScene_Timeline_2ndhalf_basketball_game():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_2ndhalf_basketball_game.tscn")

func _changeScene_Timeline_post_basketball_game():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_post_basketball_game.tscn")

func _changeScene_Timeline_snare_tutorial():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snare_tutorial.tscn")

func _changeScene_Timeline_snare_post_training():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snare_tutorial.tscn")

func _changeScene_Timeline_snare_post_maintenance_1():
	get_tree().change_scene_to_file("res://Objects/Dialogue_Scenes/timeline_snare_tutorial.tscn")

func _changeScene_Timeline_snare_Mission2():
	get_tree().change_scene_to_file("res://Objects/Temp_testing/timeline_snare_game_2_temp.tscn")

func _changeScene_Timeline_snare_Mission3():
	get_tree().change_scene_to_file("res://Objects/Temp_testing/timeline_snare_game_3_temp.tscn")
