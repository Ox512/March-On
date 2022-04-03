extends "res://Entities/Entity.gd"

var leader

export var desired_offset: int

func _ready():
	self.connect("on_death", leader, "on_troop_death")
	
	# We add some randomness to the offset for a better visual effect
	randomize()
	desired_offset += rand_range(-128, 128)

func _physics_process(delta):
	if can_move:
		# Move at a faster pace until offset is reached
		var at_offset
		if enemy:
			at_offset = position.x <= leader.position.x - desired_offset
		else:
			at_offset = position.x >= leader.position.x + desired_offset
	
		if !at_offset:
			cur_speed = speed * 3
		else:
			cur_speed = speed
