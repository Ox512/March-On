extends "res://Entities/Leader.gd"

export(Array, PackedScene) var entity_scenes

func _spawn_entity(id: int):
	var entity = entity_scenes[id].instance()
	get_tree().get_root().add_child(entity)
	entity.position = position

func _on_SpawnBarbarian_pressed():
	_spawn_entity(0)
