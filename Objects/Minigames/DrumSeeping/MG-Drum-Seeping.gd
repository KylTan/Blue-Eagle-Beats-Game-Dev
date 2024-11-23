extends Node2D
@onready var PressingSprite:Sprite2D = $Pressing
@onready var animationPlayer:AnimationPlayer = $AnimationPlayer
@onready var animationPlayer2:AnimationPlayer = $AnimationPlayer2

# Called when the node enters the scene tree for the first time.
func _ready():
	var SlidingScaleArrow = $SlidingScaleArrow
	animationPlayer.play("Pulsate")
	#animationPlayer2.play("Slide")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			if animationPlayer.is_playing():
				animationPlayer.stop() 
				animationPlayer2.play("Slide")
			else:
				animationPlayer2.pause()
				animationPlayer.play("Pulsate")

