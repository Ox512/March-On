# Generic entity script.
# Features all the stuff common to any March On enity
# This includes stuff like aligment, health, speed, etc.  

extends RigidBody2D

export var speed: int
export var health: int
export var alignment: bool

func _ready():
	$AnimatedSprite.flip_h = !alignment
