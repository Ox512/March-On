extends "res://Entities/Entity.gd"

func _ready():
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.play()
	
	cur_speed = speed
