extends Node2D
var beaterSprite
var chargeValue	
var NoteRecLight
var NoteRecHeavy
var is_Hit = false #changes when clear area is hit with the cursour with a charge
var endBuffer = 0

#bar spawning variables
var bar_scn = preload("res://Objects/Bar.tscn")
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
@onready var audiofile #= "res://Assets/Audio/Vary-Cheer.mp3"
@onready var music_node = $Music
	
#mapping file
@onready var map_file #= "res://Assets/Audio/Vary-Cheer-Bass.mboy"
@onready var nextScene
var map
var curr_bar_index = 0 
var tracks_data
var parentNode = get_parent()

#scoring
var total_note_count = 0
var percent_score = 0

#particle effect on hit
var particle = preload("res://Objects/particle_explosion.tscn")

func _ready():
	
	chargeValue = 0
	
	if parentNode:
		audiofile = parentNode.audiofile
		map_file = parentNode.mapfile
	audio = load(audiofile)
	beaterSprite = get_node("BeaterSprite") #beater
	#NoteRecLight = get_node("Note Receiver Light")
	#NoteRecHeavy = get_node("Note Receiver Heavy")
	
	map = load_map()	
	calc_params()
	tracks_data = map.tracks
	#print(map)
	music_node.setup(self)
	
	# bar spawning on ready
	for i in range(3):
		add_bar()
	
	$BeatLight.texture_scale = 0.0
		
func _process(delta):
	followMouse()
	score_check()
	bars_node.translate(Vector2(0, note_speed*delta))
	
	for bar in barList:
		if (bar.position.y + bars_node.position.y)/2 >= bar_Length_In_M:
			remove_bar(bar)
			add_bar()
			
	# animation for bg players
	if $"Note Receiver".is_Entered == true:
		$NPCSprite.play("Hit")
	if $"Note Receiver".is_Entered == false:
		$NPCSprite.play("Swing")
			
# ~~~~~Bass game functions~~~~~
func followMouse():
	# beater following mouse
	var mouse_pos = get_local_mouse_position()
	beaterSprite.position = mouse_pos

#Value of Bass charge (aka what note type)
func _on_heavy_charge_zone_mouse_entered():
	chargeValue = 2
	receiver.note_Charge = chargeValue
	playerSprite.play("swing")
	beaterSprite.play("heavy_charge")
	$IdleTimer.stop()
	
	
func _on_light_charge_zone_mouse_entered():
	chargeValue = 1
	receiver.note_Charge = chargeValue
	playerSprite.play("swing")
	beaterSprite.play("light_charge")
	$IdleTimer.stop()
	
# going to this zone counts the hit with corresponding charge a.k.a the input
func _on_clear_area_mouse_entered():
	is_Hit = true # changes the is hit in the receiver
	receiver.is_Hit = is_Hit
	playerSprite.play("hit")
	beaterSprite.play("hit")
	
	var particleChild = particle.instantiate()
	particleChild.position = Vector2(250, 900)
	particleChild.emitting = true
	add_child(particleChild)
	
	$BeatLight.texture_scale = 1.0
	
	$IdleTimer.start()

	
func _on_clear_area_mouse_exited():
	is_Hit = false
	receiver.is_Hit = is_Hit
	chargeValue = 0
	beaterSprite.play("default")
	$BeatLight.texture_scale = 0.0
	#playerSprite.play("idle") will idle as soon as u leave the drum hitbox
	
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
	#can put an else here to move to another scene
	else: # if it is null
		if endBuffer >= 2:
			get_tree().change_scene_to_file(nextScene)
		endBuffer += 1
	
func get_bar_data(): 
	if curr_bar_index < tracks_data[0].bars.size(): # keeps going til laast bar
		var heavy_data = tracks_data[0].bars[curr_bar_index] # returns bar list in current index
		var light_data = tracks_data[1].bars[curr_bar_index]
		return [heavy_data, light_data] 
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
	for i in range(2): #should iterate thru each track type in the track array
		for j in range(map.tracks[i].bars.size()): #iterates thru all the bars in a track
				total_note_count += map.tracks[i].bars[j].notes.size() #checks number of notes in each bar
	#print(total_note_count)
	
func score_check():
	if total_note_count > 0 and receiver.total_hits > 0: #check if number greater than 0
		percent_score = float(receiver.total_hits)/total_note_count * 100 # calc percent score
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
	

func _on_idle_timer_timeout():
	playerSprite.play("idle")
	chargeValue = 0
	$BeatLight.texture_scale = 0.0
