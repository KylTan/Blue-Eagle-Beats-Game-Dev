extends Control
var mission_unlock_bass = 3
var mission_unlock_snare = 3
var fp_pressed = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$SubViewportContainer/SubViewport/Path3D2/PathFollow3D2/CameraLvl.current = true
	$SubViewportContainer/SubViewport/AnimationPlayer2.play("door_open")
	$SubViewportContainer/SubViewport/AnimationPlayer.play("to_shelf")
	if Dialogic.VAR.Mission_unlock_bass > 0:
		mission_unlock_bass = Dialogic.VAR.Mission_unlock_bass
	if Dialogic.VAR.Mission_unlock_snare > 0:
		mission_unlock_snare = Dialogic.VAR.Mission_unlock_snare


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $SubViewportContainer/SubViewport.anim_fin1 > 0 && fp_pressed == 0:
		$bass_tutorial.visible = true
		$back_button.visible = true
		$free_play_button.visible = true
		if mission_unlock_bass >= 1:
			$bass_basketball_1.visible = true
		if mission_unlock_snare >= 1:
			$snare_tutorial.visible = true
		if mission_unlock_bass >= 3:
			$bass_basketball_2.visible = true
		if mission_unlock_snare >= 2:
			$snare_basketball_1.visible = true
		if mission_unlock_snare >= 3:
			$snare_basketball_2.visible = true


func _on_bass_tutorial_pressed():
	GlobalSceneManager._changeScene_Timeline_pre_training()


func _on_snare_tutorial_pressed():
	GlobalSceneManager._changeScene_Timeline_snare_tutorial()


func _on_bass_basketball_1_pressed():
	GlobalSceneManager._changeScene_Timeline_pre_basketball_game()


func _on_snare_basketball_1_pressed():
	GlobalSceneManager._changeScene_Timeline_snare_pre_bball()


func _on_bass_basketball_2_pressed():
	GlobalSceneManager._changeScene_Timeline_bass_Mission3()


func _on_snare_basketball_2_pressed():
	GlobalSceneManager._changeScene_Timeline_snare_Mission3()

func _on_back_button_pressed():
	GlobalSceneManager._changeScene_MainMenu()

# FREEPLAY 
func _on_free_play_jabba_pressed():
	GlobalSceneManager.LevelSelect = 1 #make sure this goes first
	GlobalSceneManager._changeScene_Freeplay_Bass()
	
func _on_free_play_fabilioh_pressed():
	GlobalSceneManager.LevelSelect = 2 #make sure this goes first
	GlobalSceneManager._changeScene_Freeplay_Bass()
	
func _on_free_play_fly_high_pressed():
	GlobalSceneManager.LevelSelect = 3 #make sure this goes first
	GlobalSceneManager._changeScene_Freeplay_Bass()

func _on_free_play_goat_pressed():
	GlobalSceneManager.LevelSelect = 4 #make sure this goes first
	GlobalSceneManager._changeScene_Freeplay_Bass()

func _on_free_play_button_pressed():
	if fp_pressed == 0:
		fp_pressed = 1
		
		$bass_tutorial.visible = false
		$bass_basketball_1.visible = false
		$snare_tutorial.visible = false
		$bass_basketball_2.visible = false
		$snare_basketball_1.visible = false
		$snare_basketball_2.visible = false
		$FPButtons.visible = true
		$FPButtonsSnare.visible = true
		$free_play_button.text = "To Story"
	elif fp_pressed == 1:
		fp_pressed = 0
		
		$FPButtons.visible = false
		$FPButtonsSnare.visible = false
		$free_play_button.text = "To Freeplay"


func _on_free_play_manson_pressed():
	GlobalSceneManager.LevelSelect = 5 #make sure this goes first
	GlobalSceneManager._changeScene_Freeplay_Snare()


func _on_free_play_3_fights_pressed():
	GlobalSceneManager.LevelSelect = 6 #make sure this goes first
	GlobalSceneManager._changeScene_Freeplay_Snare()


func _on_free_play_s_goat_pressed():
	GlobalSceneManager.LevelSelect = 7 #make sure this goes first
	GlobalSceneManager._changeScene_Freeplay_Snare()
