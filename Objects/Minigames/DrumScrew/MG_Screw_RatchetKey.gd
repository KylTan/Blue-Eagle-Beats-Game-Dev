extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var previous_rotation = 0
var total_rotation = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _TurnOnVisibility():
	set_visible(true)
	
func rotateKey():
	var current_rotation = rotation
	look_at(get_global_mouse_position())
	var rotation_diff = rotation - current_rotation
	rotation_diff = wrapf(rotation_diff, -PI, PI)
	total_rotation += rad_to_deg(rotation_diff) 
	total_rotation = max(total_rotation, 0)
	print("Total Rotation: ", total_rotation, " degrees") 
	
func returnRotation():
	return total_rotation
	
