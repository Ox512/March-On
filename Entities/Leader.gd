extends "res://Entities/Entity.gd"

var velocity = Vector2.ZERO

func _ready():
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.play()

func _physics_process(delta):
	# Move either forward or backward based on whether 
	# this is a player or enemy entity
	if enemy == true:
		velocity.x = -speed
	else:
		velocity.x = speed
		
	velocity.y += GRAV_ACCEL * delta
		
	velocity = move_and_slide(velocity, Vector2.UP)
