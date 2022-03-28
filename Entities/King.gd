extends RigidBody2D

export var speed = 100
export var alignment: bool # true: player | false: enemy

func _ready():
	$AnimatedSprite.flip_h = !alignment
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.play()

func _physics_process(delta):
	if alignment == true:
		position.x += speed * delta
	else:
		position.x -= speed * delta
