extends "res://Entities/Entity.gd"

func _ready():
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.play()

func _physics_process(delta):
	# Move either forward or backward based on whether 
	# this is a player or enemy entity
	if alignment == true:
		position.x += speed * delta
	else:
		position.x -= speed * delta
