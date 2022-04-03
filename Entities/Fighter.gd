extends "res://Entities/Troop.gd"

signal combat_start
signal combat_over

export var damage: float

var attack_target

func _ready():
	self.connect("combat_start", leader, "on_troop_combat_start")
	self.connect("combat_over", leader, "on_troop_combat_over")

# Release the troop from combat
func _on_target_death():
	can_move = true
	attack_target = null
	
	emit_signal("combat_over")
