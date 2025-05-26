extends Node2D
@onready var PressingSprite:Sprite2D = $Pressing
@onready var animationPlayer:AnimationPlayer = $AnimationPlayer
@onready var animationPlayer2:AnimationPlayer = $AnimationPlayer2

var SlidingScale
var SlidingScale2
var SlidingScale3
var SlidingScaleArrow

var Result
var Result2
var Result3

var Wrong = preload("res://Assets/DrumSeepingMinigame/MG2_X.png")
var Right = preload("res://Assets/DrumSeepingMinigame/MG2_Check.png")

var GameState = 0
var nextDialogueIndex
var nextDialogueScene
var animFin = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#if
	nextDialogueIndex = Dialogic.VAR.Dialogue_name
	SlidingScale = get_node("SlidingScale")
	SlidingScale2 = get_node("SlidingScale2")
	SlidingScale3 = get_node("SlidingScale3")
	SlidingScaleArrow = get_node("SlidingScaleArrow")

	Result = get_node("Result")
	Result2 = get_node("Result2")
	Result3 = get_node("Result3")

	animationPlayer.play("Pulsate")
	GameState += 1
	_SetSlidingScale()
	
	if ($SubViewportContainer2.visible):
		$SubViewportContainer2/SnareDrumBG/Ins.visible = false
	if ($SubViewportContainer.visible):
		$SubViewportContainer/BassDrumBG/Ins2.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ($SubViewportContainer2.visible):
		if ($SubViewportContainer2/SnareDrumBG.animFin == 1):
			$SlidingScale.visible = true
			$SlidingScaleArrow.visible = true
			$Pressing.visible = true
			$SubViewportContainer2/SnareDrumBG.animFin = 2
			animFin = 2
	elif ($SubViewportContainer.visible):
		if ($SubViewportContainer/BassDrumBG.animFin == 1):
			$SlidingScale.visible = true
			$SlidingScaleArrow.visible = true
			$Pressing.visible = true
			$SubViewportContainer/BassDrumBG.animFin = 2
			animFin = 2

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE and animFin == 2:
			_PlayGame()

func _PlayGame():
	if animationPlayer.is_playing(): # arrow moves, hands stop
		animationPlayer.stop()
		animationPlayer2.play("Slide")
	else:
		if(SlidingScaleArrow._isHit()):
			animationPlayer.play("Seep")
			print("Perfect!")
			_SetResult(Right)
			GameState += 1
			_SetSlidingScale()
			animationPlayer2.speed_scale += 1
		else:
			print("Missed!")
			_SetResult(Wrong)
			animationPlayer2.pause()
			animationPlayer.play("Pulsate")

	if GameState > 3:
		_EndGame()

func _SetSlidingScale():
	if GameState == 1:
		SlidingScaleArrow.set_visible(true)
		SlidingScale.set_visible(true)
		#SlidingScale.set_process(true)
	elif GameState == 2:
		SlidingScale.set_process_mode(Node.PROCESS_MODE_DISABLED)
		SlidingScale2.set_visible(true)
		#SlidingScale2.set_process(true)
	elif GameState == 3:
		SlidingScale2.set_process_mode(Node.PROCESS_MODE_DISABLED)
		SlidingScale3.set_visible(true)
		#SlidingScale3.set_process(true)

func _SetResult(result):
	if GameState == 1:
		Result.set_texture(result)
	elif GameState == 2:
		Result2.set_texture(result)
	elif GameState == 3:
		Result3.set_texture(result)

func _EndGame():
	animationPlayer2.pause()

	match nextDialogueIndex:
		1: #first training arc
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_post_training.tscn"
		2: #first training arc
			nextDialogueScene = "res://Objects/Trivia_Scenes/trivia_scene_1920s.tscn"
		3: # first bball 1 - mission 2
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_1sthalf_basketball_game.tscn"
		4:# first bball 2 - mission 2
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_2ndhalf_basketball_game.tscn"
		5: # first bball 3 - mission 2
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_post_basketball_game.tscn"
		6: # finals start
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_bass_game_3.tscn"
		7: # finals pre
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_bass_game_3_pre_finals.tscn"
		8: # finals 1st half
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_bass_game_3_1_sthalf.tscn"
		9: # finals 2nd half
			nextDialogueScene = "res://Objects/Minigames/DrumScrew/Minigame-DrumScrew-Demo.tscn"
		10: # finals post game
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_bass_game_3_post_finals.tscn"

	if animationPlayer.animation_finished and animationPlayer2.animation_finished:
		get_tree().change_scene_to_file(nextDialogueScene)
