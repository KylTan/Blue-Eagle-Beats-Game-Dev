extends Node2D
var beaterSprite
var chargeValue	
var NoteRecLight
var NoteRecHeavy
var is_Hit = false #changes when clear area is hit with the cursour with a chargek

#bar spawning variables
var bar_scn = preload("res://Objects/Snare Bar.tscn")
var barList = []
@onready var bars_node = $BarNode #was called Barsnode
var bar_Length_In_M = 945# 1080 cuz we using 2d pixels not 3d scaling
var curr_location = Vector2(261, -bar_Length_In_M)
#var speed = Vector2(0,300) # speed of notes

#Note Receiver - passes from clear area to here and back to note receiver
@onready var receiver = $"Note Receiver"
@onready var playerSprite = $PlayerSprite

#Audio timing vars
var tempo
var quarter_time_in_sec
var note_speed
var note_scale
var start_pos_in_sec #offset
var audio
var audiofile = "res://Assets/Audio/Get that Ball.mp3"
@onready var music_node = $Music
	
#mapping file
var map_file = "res://Assets/Audio/Get that Ball-Snare.mboy"
var map
var curr_bar_index = 0
var tracks_data

#scoring
var total_note_count = 0
var percent_score = 0

func _ready():
	audio = load(audiofile)
	#beaterSprite = get_node("BeaterSprite") #beater
	#NoteRecLight = get_node("Note Receiver Light")
	#NoteRecHeavy = get_node("Note Receiver Heavy")
	
	map = load_map()	
	calc_params()
	tracks_data = map.tracks
	#print(tracks_data)
	music_node.setup(self)
	
	# bar spawning on ready
	for i in range(3):
		add_bar()
		
		
func _process(delta):
	#followMouse()
	score_check()
	animationCycle()
	bars_node.translate(Vector2(0, note_speed*delta))
	
	for bar in barList:
		if (bar.position.y + bars_node.position.y)/2 >= bar_Length_In_M:
			remove_bar(bar)
			add_bar()

func animationCycle():
	if receiver.noteDir == 1: #D
		playerSprite.play("right_hit")
	elif receiver.noteDir == 2: #K
		playerSprite.play("left_hit")
	elif receiver.noteDir == 3: #space
		playerSprite.play("hit")
	else:
		playerSprite.play("swing")
			
# ~~~~~Bass game functions~~~~~
#func followMouse():
	## beater following mouse
	#var mouse_pos = get_local_mouse_position()
	#beaterSprite.position = mouse_pos
#
##Value of Bass charge (aka what note type)
#func _on_heavy_charge_zone_mouse_entered():
	#chargeValue = 2
	#receiver.note_Charge = chargeValue
	#playerSprite.play("swing")
	#
#func _on_light_charge_zone_mouse_entered():
	#chargeValue = 1
	#receiver.note_Charge = chargeValue
	#playerSprite.play("swing")
	#
## going to this zone counts the hit with corresponding charge a.k.a the input
#func _on_clear_area_mouse_entered():
	#is_Hit = true
	#receiver.is_Hit = is_Hit
	#playerSprite.play("hit")
	#
#func _on_clear_area_mouse_exited():
	#is_Hit = false
	#receiver.is_Hit = is_Hit
	#chargeValue = 0
	##playerSprite.play("idle")
	
# ~~~~~Bar spawning functions~~~~~
func add_bar():
	if get_bar_data() != null: #this check stops it from crashing out
		var bar = bar_scn.instantiate()
		bar.position = curr_location
		bar.note_scale = note_scale
		bar.bar_data = get_bar_data()
		barList.append(bar)
		bars_node.add_child(bar)
		curr_location += Vector2(0, -bar_Length_In_M)	
		curr_bar_index += 1
	
func get_bar_data(): 
	if curr_bar_index < tracks_data[0].bars.size():
		var heavy_data = tracks_data[0].bars[curr_bar_index]
		var light_data = tracks_data[1].bars[curr_bar_index]
		var double_data = tracks_data[2].bars[curr_bar_index]
		return [heavy_data, light_data, double_data] 
	else:
		return null

func remove_bar(bar):
	bar.queue_free()
	barList.erase(bar)

# ~~~~~Audio File Timing stuff~~~~~
func calc_params():
	tempo = int(map.tempo)
	bar_Length_In_M = 1890	# --> tweaking this spaces out but landing time isnt consistent,
	# maybe tweak starting position too
	quarter_time_in_sec = 60/float(tempo)
	note_speed = bar_Length_In_M/float(4*quarter_time_in_sec)
	note_scale = bar_Length_In_M/float(4*400) #idk about the 4*400 bit -> 0.675
	start_pos_in_sec = (float(map.start_pos)/400.0)*quarter_time_in_sec

	# ~~ Scoring Init. ~~ #
	
	#loops thru each track of the track then every bar to count total beats
	for i in range(3): #should iterate thru each track type in the track array
		for j in range(map.tracks[i].bars.size()): #iterates thru all the bars in a track
				total_note_count += map.tracks[i].bars[j].notes.size() #checks number of notes in each bar
	#print(total_note_count)

func score_check():
	if total_note_count > 0 and receiver.total_hits > 0:
		percent_score = float(receiver.total_hits)/total_note_count * 100
		#print(percent_score)
		#print(float(receiver.total_hits))
		$Label.text = str(int(percent_score)) + "%"

# ~~~~~Mapping Stuff~~~~~
func load_map():
	var file = FileAccess.open(map_file, FileAccess.READ) # opens and reads file
	var content = file.get_as_text()
	file.close()
	
	var json = JSON.new()
	var json_result = json.parse(content)
	#print(json.data)
	return json.data #right?
	

