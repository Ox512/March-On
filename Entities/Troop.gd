extends "res://Entities/Entity.gd"

var player

export var desired_offset: int

func _ready():
	player = get_parent().get_node("Main/Player")

func _physics_process(delta):
	if can_move:
		# Move at a faster pace until offset is reached
		if position.x < player.position.x + desired_offset:
			cur_speed = speed * 3
		else:
			cur_speed = speed
