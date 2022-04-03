extends "res://Entities/Leader.gd"

func gen_army(level: int):
	for i in level:
		for j in rand_range(1, 5):
			spawn_troop(i - 1, true)
