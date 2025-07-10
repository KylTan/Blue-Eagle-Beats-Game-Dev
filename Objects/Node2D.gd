extends Node2D


func _ready():
	for device_id in Input.get_connected_joypads():
		var name = Input.get_joy_name(device_id)
		print("Found device %d: %s" % [device_id, name])

func _process(_delta):
	for device_id in Input.get_connected_joypads():
		for button in range(20):  # Test up to 20 buttons
			if Input.is_joy_button_pressed(device_id, button):
				print("Device %d - Button %d pressed" % [device_id, button])

func _input(event):
	print(event)
