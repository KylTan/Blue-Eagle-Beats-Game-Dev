extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$CharLeft.play("idle")
	$CharLeft2.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	GlobalSceneManager._changeScene_LevelSelect()
	
func _on_credits_pressed():
	$SubViewportContainer/SubViewport/AnimationPlayer.play("to_table")
	
func _on_exit_pressed():
	get_tree().quit()

func _on_exit_mouse_entered():
	$CharLeft.play("default")
	$CharLeft2.play("default")
	$AnimationPlayer.play("Highlight")
	
func _on_start_mouse_entered():
	$SubViewportContainer/SubViewport/AnimationPlayer.play("door_focus")
	$CharLeft.play("swing")
	$CharLeft2.play("swing")
	$AnimationPlayer.play("Highlight")

func _on_exit_mouse_exited():
	$CharLeft.play("idle")
	$CharLeft2.play("idle")
	$AnimationPlayer.stop()

func _on_start_mouse_exited():
	$SubViewportContainer/SubViewport/AnimationPlayer.stop()
	$CharLeft.play("idle")
	$CharLeft2.play("idle")
	$AnimationPlayer.stop()



