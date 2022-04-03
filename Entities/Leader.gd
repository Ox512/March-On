extends "res://Entities/Entity.gd"

export(Array, PackedScene) var troop_scenes

var troops: int
var troops_free: int

func _ready():
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.play()
	
	cur_speed = speed

func _process(delta):
	# We can only move when not in combat
	can_move = troops_free == troops

func spawn_troop(id: int, is_enemy: bool):
	var entity = troop_scenes[id].instance()
	entity.leader = self
	entity.enemy = is_enemy
	
	troops += 1
	troops_free += 1
	
	get_tree().get_root().add_child(entity)
	entity.position = position

func on_troop_death():
	troops -= 1

func on_troop_combat_start():
	troops_free -= 1

func on_troop_combat_over():
	troops_free += 1
