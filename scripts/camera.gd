extends Camera3D

# Configuration variables
var zoom_speed: float = 2.0
var max_fov: float = 70.0  # Maximum field of view (less zoom)
var min_fov: float = 15.0  # Minimum field of view (more zoom)

var sensitivity: float = 0.5  # Adjust for faster or slower rotation
var is_rotating: bool = false
var last_mouse_position: Vector2 = Vector2.ZERO

func _ready():
	fov = 50.0

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			if size > 20:
				size -= zoom_speed
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			# Increase FOV to zoom out
			if size < 200:
				size += zoom_speed
				
		if event.button_index == MOUSE_BUTTON_MIDDLE and event.pressed:
			is_rotating = true
			last_mouse_position = get_viewport().get_mouse_position()
		elif event.button_index == MOUSE_BUTTON_MIDDLE:
			is_rotating = false
			
	elif event is InputEventMouseMotion and is_rotating:
		var mouse_motion = event.relative
		var x_rotation = deg_to_rad(-mouse_motion.y * sensitivity)
		var local_x_rot = Basis(Vector3(1, 0, 0), x_rotation)
		global_transform.basis = global_transform.basis * local_x_rot
