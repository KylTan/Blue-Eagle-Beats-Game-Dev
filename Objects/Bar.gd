extends Node2D

var bassNoteHeavy = preload("res://Objects/Bass Note Heavy.tscn")
var bassNoteLight = preload("res://Objects/Bass Note Light.tscn")

var notes_data = [
	{
		"pos": 0,
		#"len":100
	},
	{
		"pos": 400,
		#"len":100
	},
	{
		"pos": 800,
		#"len":100
	},
	{
		"pos": 1200,
		#"len":100
	}
]

#
var note_scale = 0.590
#0.675 # 8 godot units / 1600 somethings, we do 1080/1600 cuz 2d pixels ig
#dividing the imagined length over the actual length of the container

# Called when the node enters the scene tree for the first time.
func _ready():
	add_notes()

func add_notes():
	for note_data in notes_data:
		var noteH = bassNoteHeavy.instantiate()
		var noteL = bassNoteLight.instantiate()
		
		#for note type, maybe add a third thing in the json to signify the note type (pos, len, type)
		#then put an if statement on what instance to use
		#var note = noteH.instantiate()
		# note.line = 1 this is for mania type, but we only have one column
		
		randomize()
		var noteType = (randi() % 2) +1
		match noteType:
			1:
				noteH.notePosition = int(note_data.pos) * note_scale	 # takes from the list
				add_child(noteH)
			2:
				noteL.notePosition = int(note_data.pos) * note_scale	 # takes from the list
				add_child(noteL)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
