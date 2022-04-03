extends "res://Entities/Leader.gd"

export(Array, int) var troop_costs

var available_tags = 5

func spawn_troop_if_possible(id: int):
	if available_tags >= troop_costs[id]:
		available_tags -= troop_costs[id]
		spawn_troop(id, false)

func _on_SpawnBarbarian_pressed():
	spawn_troop_if_possible(0)
