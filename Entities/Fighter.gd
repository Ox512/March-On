extends "res://Entities/Troop.gd"

export var damage: float

var attack_target

# releases the troop from combat
func _on_target_death():
	can_move = true
	attack_target = null
