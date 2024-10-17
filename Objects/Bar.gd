extends Node2D

var bassNoteHeavy = preload("res://Objects/Bass Note Heavy.tscn")
var bassNoteLight = preload("res://Objects/Bass Note Light.tscn")

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

func add_notes():
	var line = 1 # line must be like thenotes in a bar or smt
	var bar = 0
	for line_data in bar_data: #bar_data is the [heavy, light] list -> so plots all the heavy then light?
		var notes_data = line_data.notes
		for note_data in notes_data:
			var noteH = bassNoteHeavy.instantiate()
			var noteL = bassNoteLight.instantiate()
			noteH.notePosition = int(note_data.pos) * note_scale
			noteL.notePosition = int(note_data.pos) * note_scale
			match bar:
				0:
					add_child(noteH)
				1:
					add_child(noteL)
			line += 1
		bar +=1
		#for note type, maybe add a third thing in the json to signify the note type (pos, len, type)
		#then put an if statement on what instance to use
		#var note = noteH.instantiate()
		# note.line = 1 this is for mania type, but we only have one column
		
		#randomize()
		#var noteType = (randi() % 2) +1
		#match noteType:
			#1:
				#noteH.notePosition = int(note_data.pos) * note_scale	 # takes from the list
				#add_child(noteH)
			#2:
				#noteL.notePosition = int(note_data.pos) * note_scale	 # takes from the list
				#add_child(noteL)
