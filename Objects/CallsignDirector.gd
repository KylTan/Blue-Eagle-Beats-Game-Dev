extends AnimatedSprite2D
var curr_bar_index # for dynamic changing cheers
var parent
var cheerIndex = 1
var cheerMode = 1

func _ready():
	parent = get_parent()
	
	#check which mode, and see if valid var
	if parent.name == "Bass Game" and Dialogic.VAR.Song_played:
		cheerIndex = Dialogic.VAR.Song_played
		cheerMode = 1
	elif parent.name == "Snare Game" and Dialogic.VAR.Song_played_snare:
		cheerIndex = Dialogic.VAR.Song_played_snare
		cheerMode = 2
	
	#checks mode, then checks which order the story is in (cheerindex)
	match cheerMode:
		1: #for bass
			match cheerIndex:
				3:
					_FabiliohCall()
				4:
					_FlyHighCall()
				5:
					_GoAtCall()
		2: #for snare
			match cheerIndex:
				3:
					_3FightsCall()
				4:
					_MansonCall()
				5:
					_GoAtCall()

func _process(delta):
	# counts where the cheer is at for the endurance cheers
	if cheerIndex == 1 or cheerIndex == 2:
		if parent.curr_bar_index: 
			curr_bar_index = parent.curr_bar_index
			print(curr_bar_index)
	
	if cheerIndex == 1:
		_training_endurance()
	if cheerIndex == 2:
		_1st_bball_endurance()
		
func _VaryCall():
	play("Vary")
	$Arrows.visible = false
	$Label.text = "Vary"
	
func _GTBCall():
	play("GTB")
	$Arrows.visible = false
	$Label.text = "Get That Ball"
	
func _OtsoCall():
	play("Otso")
	$Arrows.visible = false
	$Label.text = "Otso"
	
func _3FightsCall():
	play("3Fights")
	$Arrows.play("3Fights")
	$Arrows.position.y = 360
	$Label.text = "3 Fights"
	
func _FabiliohCall():
	play("Fabilioh")
	$Arrows.play("Fabilioh")
	$Arrows.position.x = 0
	$Arrows.position.y = 0
	$Arrows.scale.x = 1.75
	$Arrows.scale.y = 1.75
	$Label.text = "Fabilioh"

func _FlyHighCall():
	play("Fly High")
	$Arrows.visible = false
	$Label.text = "Fly High"

func _GoAtCall():
	play("Go Ateneo")
	$Arrows.play("Go Ateneo")
	$Arrows.position.x = 250
	$Arrows.position.y = 450
	$Label.position.y = 1200
	$Label.text = "Go Ateneo"

func _QuatroCall():
	play("Quatro")
	$Arrows.visible = false
	$Label.text = "Quatro"

func _MansonCall():
	play("Manson")
	$Arrows.visible = false
	$Label.text = "Manson"
	
func _JabbaCall():
	play("Jabba")
	$Arrows.visible = false
	$Label.text = "Jabba"

# unique funcs for endurance strings
func _training_endurance():
	if curr_bar_index > 0 and curr_bar_index < 9:
		_VaryCall()
	if curr_bar_index > 9 and curr_bar_index < 17:
		_GTBCall()
	if curr_bar_index > 17:
		_OtsoCall()
	
func _1st_bball_endurance():
	if curr_bar_index > 0 and curr_bar_index < 9:
		_VaryCall()
	if curr_bar_index > 9 and curr_bar_index < 13:
		_GTBCall()
	if curr_bar_index > 13 and curr_bar_index < 18:
		_VaryCall()
	if curr_bar_index > 18 and curr_bar_index < 23:
		_OtsoCall()
	if curr_bar_index > 23:
		_VaryCall()
	
