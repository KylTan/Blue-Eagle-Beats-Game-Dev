extends Control
var mission_unlock_bass = 3
var mission_unlock_snare = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


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
