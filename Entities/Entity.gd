# Generic entity script.
# Features all the stuff common to any March On entity
# This includes stuff like health, speed, and movement  

extends KinematicBody2D

signal on_death

const GRAV_ACCEL = 265

export var speed: int
export var health: float
export var enemy: bool

var velocity = Vector2.ZERO
var can_move = true # Can this enitity continue moving forward
var cur_speed       # Speed the entity will actually move at

func _ready():
	$AnimatedSprite.flip_h = enemy
	$AnimatedSprite.set_animation("walk")
	
	if enemy:
		set_collision_layer_bit(2, true)
		set_collision_mask_bit(1, true)
	else:
		set_collision_layer_bit(1, true)
		set_collision_mask_bit(2, true)

# Common physics actions
func _physics_process(delta):
	if can_move:
		# Directrion based on Enemy/Player
		if enemy == true:
			velocity.x = -cur_speed
		else:
			velocity.x = cur_speed
		
		velocity.y += GRAV_ACCEL * delta
		
		velocity = move_and_slide(velocity, Vector2.UP)

func take_damage(damage: float):
	health -= damage
	
	if health <= 0:
		_die()

func _die():
	emit_signal("on_death")
	queue_free()
