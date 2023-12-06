extends Sprite3D

# Initial velocity
var velocity = Vector3(5, 0, 0)  # Adjust as needed
var speed = 3  # Adjust as needed

# Deceleration factor
var deceleration = 1.3  # Adjust the rate of deceleration as needed

func initialize(initial_position: Vector3, facing_direction: Vector3):
	self.set_position(initial_position)
	velocity = facing_direction

func _process(delta: float) -> void:
	# Update the sprite's position
	global_transform.origin += velocity * delta * speed

	# Apply deceleration
	velocity = velocity.lerp(Vector3.ZERO, deceleration * delta)

	# Check if the sprite has nearly stopped
	if velocity.length() < 0.01:  # Threshold for 'stopping'
		queue_free()  # Remove the sprite from the scene
