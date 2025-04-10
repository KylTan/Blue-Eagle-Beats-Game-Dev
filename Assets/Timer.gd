extends Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	var random_time = randf_range(1, 3)
	self.wait_time = random_time
	self.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
