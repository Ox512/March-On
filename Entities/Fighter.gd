extends "res://Entities/Entity.gd"

export var desired_offset: int

var offset

func _init(align: bool):
	alignment = align

func _physics_process(delta):
	pass # move entity forwards. move faster until offset 	is reached
