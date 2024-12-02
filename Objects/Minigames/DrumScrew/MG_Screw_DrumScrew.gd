extends TextureButton

var ratchetKey_pressed = preload("res://Assets/DrumScrewMinigame/MG_Screw_KeyPressed.png")
var cursor = preload("res://Assets/DrumScrewMinigame/MG_Screw_RatchetKey.png")
var ratchetKey2D
var progressMeter2D
var parent
@export var turnAmt: int

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	$ProgressMeter.max_value = 360
	ratchetKey2D = get_node("RatchetKey")
	progressMeter2D = get_node("ProgressMeter")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(isScrewed()):
		set_visible(false)
	else:
		if(is_pressed()):
			_use_ratchet_key()
		

var buttonPressed = false


func _use_ratchet_key():
	if(buttonPressed):
		set_disabled(true)
		self_modulate.a = 0
		#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		Input.set_custom_mouse_cursor(null, Input.CURSOR_ARROW)		
		ratchetKey2D._TurnOnVisibility()
		ratchetKey2D.rotateKey()
		meterFunctions()
	else:
		buttonPressed = true

func meterFunctions():
	progressMeter2D.set_visible(true)
	progressMeter2D.set_value(ratchetKey2D.returnRotation())

func isScrewed():
	if(ratchetKey2D.returnRotation() >= turnAmt):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) 
		if parent:
			parent.screwTotal -= 1
		Input.set_custom_mouse_cursor(cursor, Input.CURSOR_ARROW, Vector2(75,90))
		queue_free()
		return true
	else:
		return false

