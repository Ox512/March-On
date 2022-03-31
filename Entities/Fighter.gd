extends "res://Entities/Entity.gd"

export var desired_offset: int

var player
var cur_speed
var velocity = Vector2.ZERO

func _ready():
	player = get_parent().get_node("Main/Player")
	
	# We add some randomness to the offset for a better visual effect
	randomize()
	desired_offset += rand_range(-128, 128)

func _physics_process(delta):
	
	# Move at double time until speed is reached
	if position.x < player.position.x + desired_offset:
		cur_speed = speed * 2
	else:
		cur_speed = speed
		
	if enemy == true:
		velocity.x = -cur_speed
	else:
		velocity.x = cur_speed
		
	velocity.y += GRAV_ACCEL * delta
		
	velocity = move_and_slide(velocity, Vector2.UP)
