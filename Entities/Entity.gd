# Generic entity script.
# Features all the stuff common to any March On enity
# This includes stuff like aligment, health, speed, etc.  

extends KinematicBody2D

const GRAV_ACCEL = 265

export var speed: int
export var health: int
export var enemy: bool

func _ready():
	$AnimatedSprite.flip_h = enemy
	$AnimatedSprite.set_animation("walk")
