extends SubViewport
var brasstimer

# Called when the node enters the scene tree for the first time.
func _ready():
	$WorldEnvironment/AnimationPlayer.play("Clouds")
	randomize()
	brasstimer = randi_range(1,30)
	$BrassRandomTimer.wait_time = brasstimer
	$BrassRandomTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_ambiance_finished():
	$Ambiance.play()

func _on_brass_random_timer_timeout():
	var flip = randi_range(1,2)
	if flip == 1:
		$BrassRandomTimer/Brass.play()
