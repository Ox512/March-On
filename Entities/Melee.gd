extends "res://Entities/Fighter.gd"

export var cooldown: float

var cur_cooldown

func _ready():
	cur_cooldown = cooldown
	
	# We add some randomness to the offset for a better visual effect
	randomize()
	desired_offset += rand_range(-128, 128)

func _process(delta):
	cur_cooldown += delta
	
	if attack_target == null:
		can_move = true
	
	if !can_move and cur_cooldown >= cooldown and attack_target != null:
		cur_cooldown = 0
		attack_target.take_damage(damage * rand_range(0.6, 1.2))

func _physics_process(delta):
	for i in get_slide_count():
		var collider = get_slide_collision(i).get_collider()
		if collider != null and collider != attack_target and collider.is_in_group("entities"):
			can_move = false
			attack_target = collider
			attack_target.connect("on_death", self, "_on_target_death")
