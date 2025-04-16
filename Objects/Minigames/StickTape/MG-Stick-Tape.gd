extends Node2D

@onready var animationPlayer:AnimationPlayer = $AnimationPlayer
@onready var animationPlayer2:AnimationPlayer = $AnimationPlayer2
@onready var animationPlayer3:AnimationPlayer = $AnimationPlayer3

@onready var drumstick1:Sprite2D = $Mg3DrumStick1
@onready var pathArea2:Area2D = $PathArea2
#@onready var drumstick2:Sprite2D = $Mg3DrumStick2

var game_state: int = 0

var circle_color: Color = Color.RED
var total_time: float = 0.0
var inside_time: float = 0.0
var is_inside: bool = false
#var threshold: float = 0.75
var progressMeter2D
var instructions2D

var nextDialogueIndex = 3
var nextDialogueScene



# Called when the node enters the scene tree for the first time.
func _ready():
	progressMeter2D = get_node("progressBar1")
	instructions2D = get_node("instructions")
	animationPlayer.play("Start")
	if Dialogic.VAR.Dialogue_name_snare:
		nextDialogueIndex = Dialogic.VAR.Dialogue_name_snare
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_state == 0:
		if(!animationPlayer.is_playing()):
			progressMeter2D.set_visible(true)
			instructions2D.set_visible(true)
	elif game_state == 1:
		animationPlayer2.play("Taping1")
		game_state += 1
	elif game_state == 2:
		meterFunctions()	
		moveStick(delta)
	elif game_state == 3: # its done
		if !animationPlayer3.is_playing():
			reset()
			progressMeter2D.set_max(55)
			drumstick1.move_to_front()
			pathArea2.move_to_front()
			animationPlayer.play("Start2")
			game_state += 1
			pass
	elif game_state == 4: #buffer so stick 2 doesn't move before a mouse click
		pass
	elif game_state == 5:
		animationPlayer2.play("Taping2")
		game_state += 1
	elif game_state == 6:
		meterFunctions()
		moveStick(delta)
	elif game_state == 7: # its done
		if !animationPlayer3.is_playing():
		#_game_over_exit()
			if nextDialogueIndex == 3:
				GlobalSceneManager._changeScene_Timeline_snare_post_maintenance()
			elif nextDialogueIndex == 8:
				GlobalSceneManager._changeScene_Timeline_snare_Mission3_2ndhalf()
	queue_redraw()
	

func _input(event):
	if not event is InputEventMouseButton:
		return
	if game_state == 0 or game_state == 4:
		if !animationPlayer.is_playing() and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			game_state += 1

func moveStick(delta):
	total_time += delta
	if is_inside:
		inside_time += delta

	if total_time > 0 and !animationPlayer2.is_playing():
		print(inside_time)
		print(total_time)
		print(inside_time / total_time)
		print(progressMeter2D.value)
		if progressMeter2D.value >= progressMeter2D.max_value:
			if game_state == 2:
				animationPlayer3.play("EndTaping1")
			elif game_state == 6:
				animationPlayer3.play("EndTaping2")
				progressMeter2D.set_visible(false)
				instructions2D.set_visible(false)
			game_state += 1
		else:
			reset()
		
func reset():
	if game_state == 2:
		animationPlayer2.play("Taping1", -2, -3, true)
		game_state = 0
	elif game_state == 6:
		animationPlayer2.play("Taping2", -2, -3, true)
		game_state = 4
	total_time = 0
	inside_time = 0
	progressMeter2D.set_value(0)
	
	
func meterFunctions():
	progressMeter2D.set_value(inside_time * 10)
	
func _draw():
	draw_circle(get_global_mouse_position(), 25, circle_color)

func _on_path_area_mouse_entered():
	circle_color = Color.GREEN
	is_inside = true

func _on_path_area_mouse_exited():
	circle_color = Color.RED
	is_inside = false
	
func _game_over_exit():
	
	match nextDialogueIndex:
		1: #first training arc
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snare_post_training.tscn" # 2nd dialog
		2: #first training arc
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snare_post_maintanance_1.tscn"
		#3: # first bball - pre bball - omitted since its a mission start thing
			#nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snare_pre_bball.tscn"
		3: # first bball - 1st half
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snare_1sthalf_bball.tscn"
		4: # first bball - 2nd half
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snare_2ndhalf_bball.tscn"
		5: # first bball - post bball
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snare_post_bball.tscn"
			# start with finals 3 
		6:  # finals pre
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snaregame_3_pre_finals.tscn"
		7: # finals 1st
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snaregame_3_1sthalf.tscn"
		8: # finals 2nd
			nextDialogueScene = "res://Objects/Trivia_Scenes/trivia_scene_events.tscn"
		9: # finals 3rd
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_snaregame_3_post_finals.tscn"
	

	
