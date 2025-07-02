extends SubViewport
var animFin = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().is_visible():
		$AnimationPlayer.play("BassPlacing")
		$AnimationPlayer/BassSounds.play()
		$AnimationPlayer/BGSound.play()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	animFin = 1


func _on_bg_sound_finished():
	$AnimationPlayer/BGSound.play()
