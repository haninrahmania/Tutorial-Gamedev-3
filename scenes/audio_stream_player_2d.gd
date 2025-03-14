extends AudioStreamPlayer2D

@export var player: NodePath  # Assign the player node in the Inspector
@export var spawn_position: Vector2  # Set the spawn point manually or in _ready()
@export var max_distance: float = 500.0  # Distance at which volume reaches minimum
@export var min_db: float = -30.0  # Minimum volume in decibels (faded out)

func _process(_delta):
	if not player:
		return
	
	var player_node = get_node(player)
	var distance = spawn_position.distance_to(player_node.global_position)

	# Normalize volume based on distance
	var volume = clamp(remap(distance, 0, max_distance, 0, min_db), min_db, 0)
	volume_db = volume
