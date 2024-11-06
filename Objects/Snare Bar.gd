extends Node2D

var snareNoteLeft = preload("res://Objects/Snare_Note_Left.tscn")
var snareNoteRight = preload("res://Objects/Snare_Note_Right.tscn")
var snareNoteDouble = preload("res://Objects/Snare_Note_Double.tscn")

#var notes_data = [
	#{
		#"pos": 0,
		##"len":100
	#},
	#{
		#"pos": 400,
		##"len":100
	#},
	#{
		#"pos": 800,
		##"len":100
	#},
	#{
		#"pos": 1200,
		##"len":100
	#}
#]

#
var note_scale # = 0.590
var bar_data
#0.675 # 8 godot units / 1600 somethings, we do 1080/1600 cuz 2d pixels ig
#dividing the imagined length over the actual length of the container

# Called when the node enters the scene tree for the first time.
func _ready():
	add_notes()

#determines what kind of note to spawn based on the data from the map file
func add_notes():
	var line = 1 # line must be like thenotes in a bar or smt
	var bar = 0
	for line_data in bar_data: #bar_data is the [heavy, light] list -> so plots all the heavy then light?
		var notes_data = line_data.notes
		for note_data in notes_data:
			var noteLft = snareNoteLeft.instantiate()
			var noteRgt = snareNoteRight.instantiate()
			var noteDb = snareNoteDouble.instantiate()
			noteLft.notePosition = int(note_data.pos) * note_scale
			#noteLft.Sprite2D.scale = 0.5
			noteRgt.notePosition = int(note_data.pos) * note_scale
			#kdkdkdnoteRgt.Sprite2D.scale = 0.5
			noteDb.notePosition = int(note_data.pos) * note_scale
			match bar:
				0:
					add_child(noteLft)
				1:
					add_child(noteRgt)
				2:
					add_child(noteDb)
					
			line += 1
		bar +=1
		#for note type, maybe add a third thing in the json to signify the note type (pos, len, type)
		#then put an if statement on what instance to use
