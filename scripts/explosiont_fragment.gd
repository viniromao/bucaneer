extends Area3D

var velocity = Vector3()
var fragment_gravity = Vector3(0, -9.8, 0)  # Gravity vector (can be adjusted)
var speed = 5.0  # Initial speed for spreading

func _ready():
	var spread_direction = Vector3(randf_range(-1, 1), randf_range(-1, 1), randf_range(-1, 1)).normalized()
	velocity = spread_direction * speed

func _process(delta):
	# Apply gravity to the velocity
	velocity += fragment_gravity * delta

	# Update the position based on the velocity
	global_transform.origin += velocity * delta

	# Check if the fragment has fallen below a certain height (e.g., ground level)
	if global_transform.origin.y < 0:
		queue_free()

func set_position_fragment(position):
	global_transform.origin = position
