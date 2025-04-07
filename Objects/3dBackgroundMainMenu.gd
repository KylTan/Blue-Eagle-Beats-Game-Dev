extends SubViewport
var parent
var anim_fin1 = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#parent = get_parent().get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#if parent._on_credits_pressed():
		#$AnimationPlayer.play("to_table")


func _on_animation_player_animation_finished(anim_name):
	anim_fin1 = 1

func _on_animation_player_2_animation_finished(anim_name):
	pass # Replace with function body.
