extends Node2D

@onready var animationPlayer:AnimationPlayer = $AnimationPlayer
@onready var animationPlayer2:AnimationPlayer = $AnimationPlayer2
@onready var animationPlayer3:AnimationPlayer = $AnimationPlayer3

@onready var drumstick1:Sprite2D = $Mg3DrumStick1

var game_state: int = 0

var circle_color: Color = Color.RED
var total_time: float = 0.0
var inside_time: float = 0.0
var is_inside: bool = false
var threshold: float = 0.75

var nextDialogueIndex
var nextDialogueScene


# Called when the node enters the scene tree for the first time.
func _ready():
	animationPlayer.play("Start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
	if game_state == 1:
		animationPlayer2.play("Taping1")
		game_state += 1
	elif game_state == 2:	
		total_time += delta
		if is_inside:
			inside_time += delta

		if total_time > 0 and !animationPlayer2.is_playing():
			move_child(drumstick1, get_child_count() - 1)
			animationPlayer3.play("EndTaping1")
			print(inside_time)
			print(total_time)
			print(inside_time / total_time)
			game_state += 1
	elif game_state == 3: # its done
		if !animationPlayer3.is_playing():
			pass
	

func _input(event):
	if !animationPlayer.is_playing() and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and game_state == 0:
		game_state += 1

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
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_post_training.tscn"
		2: #first training arc
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_post_maintenance.tscn"
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
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_bass_game_3_2_ndhalf.tscn"
		10: # finals post game
			nextDialogueScene = "res://Objects/Dialogue_Scenes/timeline_bass_game_3_post_finals.tscn"

	get_tree().change_scene_to_file(nextDialogueScene)
