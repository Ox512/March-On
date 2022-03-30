extends "res://Entities/Leader.gd"

export(Array, PackedScene) var entity_scenes

func _spawn_entity(id: int):
	pass

func _on_SpawnBarbarian_pressed():
	_spawn_entity(0)
