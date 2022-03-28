extends Camera2D

export var speed = 50

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("cam_move_right"):
		velocity.x += 1
	if Input.is_action_pressed("cam_move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("cam_move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("cam_move_down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		position += velocity * delta
