extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$SubViewportContainer/SubViewport/AnimationPlayer2.play("door_open")
	$SubViewportContainer/SubViewport/AnimationPlayer.play("to_table")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
