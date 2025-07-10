extends Node2D
var audiofile1 = preload("res://Assets/Audio/Otso-Cheer.mp3")
@onready var player = $AudioStreamPlayer2D

var speed
var started = false
var pre_start_duration
var start_pos_in_sec

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#player.stream = audio
	#player.play()
	
func setup(game):
	player.stream = game.audio
	
	speed = game.note_speed
	started = false
	pre_start_duration = game.bar_Length_In_M
	start_pos_in_sec = game.start_pos_in_sec
	
func start():
	started = true
	player.play(start_pos_in_sec)
	
func _process(delta):
	if !started:
		pre_start_duration -= speed*delta
		if pre_start_duration <= 0:
			start()
			return
		
	
	 
