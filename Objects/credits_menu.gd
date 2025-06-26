extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$SubViewportContainer/SubViewport/AnimationPlayer2.play("door_open")
	$SubViewportContainer/SubViewport/AnimationPlayer.play("to_table")
	$Credits.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $SubViewportContainer/SubViewport.anim_fin1 == 1:
		$Credits.visible = true
		$AnimationPlayer.play("hover")


func _on_back_button_pressed():
	GlobalSceneManager._changeScene_MainMenu()


func _on_animation_player_animation_finished(anim_name):
	$AnimationPlayer.play("hover")
