extends Node2D
var is_Hit = false #activates hit window to "eat" notes
var is_pressed = false
var noteDir #1 L, 2 R, etc.
var total_hits = 0
var particle = preload("res://Objects/particle_explosion.tscn")
var is_Entered = 0
var last_right_hit_time = 0
var last_left_hit_time = 0
var double_hit_window = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	for device_id in Input.get_connected_joypads():
		var name = Input.get_joy_name(device_id)
		print("Found device %d: %s" % [device_id, name])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 

# receiever may not actually know when a beat is hit, only "activates" the window to "eat" notes
func _input(event):
	# particle effect for hits
	var particleChild = particle.instantiate()
	particleChild.position = Vector2(149, 43)
	particleChild.emitting = true

	if event.is_action_pressed("space_key"):
		is_pressed = true
		is_Hit = true
		noteDir = 3
		add_child(particleChild)
		print("double")
	elif event.is_action_pressed("D_key") or event.is_action_pressed("Taiko_Left"):
		handle_left_hit()
	elif event.is_action_pressed("K_key") or event.is_action_pressed("Taiko_Right"):
		handle_right_hit()

	if !event.is_action_pressed("K_key") and !event.is_action_pressed("D_key") and !event.is_action_pressed("space_key") and !event.is_action_pressed("Taiko_Right") and !event.is_action_pressed("Taiko_Left"): 
		is_pressed = false
		is_Hit = false
		noteDir = 0

func _on_area_2d_area_entered(area):
	if area.name == "DoubleArea":
		is_Entered = 1
	if area.name == "LeftArea":
		is_Entered = 2
	if area.name == "RightArea":
		is_Entered = 3

func _on_area_2d_area_exited(area):
	is_Entered = 0
	
func handle_left_hit():
	var current_time = Time.get_ticks_msec()  # Get the current time in milliseconds

	# Check if the right button was pressed recently (within the double hit window)
	if current_time - last_right_hit_time <= double_hit_window:
		print("Double hit! Left and Right hit together!")
		trigger_double_hit()
	else:
		# Otherwise, it's just a single left hit
		print("Left hit!")
		is_pressed = true
		is_Hit = true
		noteDir = 1
		#add_child(particleChild)
	
	# Update the last left hit time
	last_left_hit_time = current_time

func handle_right_hit():
	var current_time = Time.get_ticks_msec()  # Get the current time in milliseconds

	# Check if the left button was pressed recently (within the double hit window)
	if current_time - last_left_hit_time <= double_hit_window:
		print("Double hit! Left and Right hit together!")
		trigger_double_hit()
	else:
		# Otherwise, it's just a single right hit
		print("Right hit!")
		is_pressed = true
		is_Hit = true
		noteDir = 2
		#add_child(particleChild)

	
	# Update the last right hit time
	last_right_hit_time = current_time

func trigger_double_hit():
	is_pressed = true
	is_Hit = true
	noteDir = 3
	print("double")
