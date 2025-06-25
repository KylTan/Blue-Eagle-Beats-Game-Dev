extends Node2D
var notePosition = 0
var is_colliding = false
var collected = false
var receiver 
var feedback = preload("res://Objects/hit_feedback_sprite.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_Position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	collect()
	
func set_Position():
	self.position = Vector2 (0, -notePosition)

func collect():
	if !collected: # if beat is not yet collected or hit
		#only deletes itself if its the proper charge
		if is_colliding and receiver.is_Hit and receiver.note_Charge == 2: #if its colliding and can access the receiver
			collected = true
			receiver.is_Hit = false #collecting
			receiver.total_hits += 1
			
			if get_tree().root.get_node("Hit Feedback"):
				get_tree().root.get_node("Hit Feedback").queue_free()
			
			get_tree().root.add_child(feedback)
			feedback.get_node("Hit").show()
			feedback.get_node("Miss").hide()
			feedback.get_node("AnimationPlayer").play("Hitpop")
			feedback.position = Vector2(807,469)
			queue_free()

func _on_area_2d_area_entered(area):
	if area.is_in_group("receiver"):
		is_colliding = true
		receiver = area.get_parent()

func _on_area_2d_area_exited(area):
	if area.is_in_group("receiver"):
		is_colliding = false
	
	if !collected:
		
		if get_tree().root.get_node("Hit Feedback"):
				get_tree().root.get_node("Hit Feedback").queue_free()
		
		get_tree().root.add_child(feedback)
		feedback.get_node("Miss").show()
		feedback.get_node("Hit").hide()
		feedback.get_node("AnimationPlayer").play("Misspop")
		feedback.position = Vector2(807,469)
