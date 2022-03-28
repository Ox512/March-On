extends Node

export (Array, Array, PackedScene) var biomes

const CHUNK_WIDTH = 256
const CHUNK_COUNT = 15

export var delete_dist = 1280 # distance from player at which chunks are deleted

var chunks = []
var back_index = 0 # Chunk furtherest behind player
var front_x        # x position of

func _ready():
	chunks.resize(CHUNK_COUNT)
	
	# Place the initial 10 active chunks
	for i in CHUNK_COUNT:
		randomize()
		chunks[i] = biomes[0][randi() % 3].instance()
		add_child(chunks[i])
		chunks[i].position = Vector2(i * CHUNK_WIDTH, 352)
	
	front_x = chunks[CHUNK_COUNT - 1].position.x

func _process(delta):
	if chunks[back_index].position.x < $Player/King.position.x - delete_dist:
		chunks[back_index].queue_free()
		
		# Generate new chunk at the front
		randomize()
		chunks[back_index] = biomes[0][randi() % 3].instance()
		add_child(chunks[back_index])
		chunks[back_index].position = Vector2(front_x  + CHUNK_WIDTH, 352)
		
		front_x += CHUNK_WIDTH
		
		if back_index == CHUNK_COUNT - 1:
			back_index = 0
		else:
			back_index += 1
