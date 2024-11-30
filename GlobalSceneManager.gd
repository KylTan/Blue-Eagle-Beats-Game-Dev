#Global Variable For calling function to scene Change Scene needs to be global for dialogic to detect
extends Node

func _changeScene_demo_Bass():
	get_tree().change_scene_to_file("res://Objects/main_game_scene.tscn")

func _changeScene_demo_Snare():
	get_tree().change_scene_to_file("res://Objects/Snare Game.tscn")

func _changeScene_MainMenu():
	get_tree().change_scene_to_file("res://Objects/main_menu.tscn")

#Scenes for Dialogic Timelines obsolete might be needed again idk yet

#func _changeScene_Timeline1():
	#get_tree().change_scene_to_file("res://Objects/Timeline_start.tscn")

#func _changeScene_Timeline2():
	#get_tree().change_scene_to_file("res://Objects/Timeline_level_2.tscn")
