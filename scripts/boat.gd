extends Node3D

@export var speed = 5.0
@export var rotation_speed = 5.0
var boat_foam
var cannon_ball
var foam_cool_down
var foam_timeout
var amplitude = 2
var frequency = 1  
var time_passed = 0.0

func _ready():
	boat_foam = load("res://elements/boat_foam.tscn")
	cannon_ball = load("res://elements/cannon_ball.tscn")
	foam_cool_down = 0
	foam_timeout = 5
	shoot_cannon_ball(get_facing_direction_y_rotated_90())
	
	

func _process(delta):
	time_passed += delta
	var angle = sin(time_passed * frequency) * amplitude
	rotation.x = deg_to_rad(angle)
	
	
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_forward"):
		direction.z += -1
	if Input.is_action_pressed("move_left"):
		direction.x += -1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
		
	if direction.z != 0:
		translate(Vector3(0,0,direction.z).normalized() * speed * delta)
		instantiate_foam()
		
		
		if direction.z != 0:
			rotate(Vector3(0,-direction.x,0).normalized(), rotation_speed)
			
func instantiate_foam():
	foam_cool_down += 1
	if (foam_cool_down > foam_timeout):
		var facing_direction = get_facing_direction_y_rotated_90()
		
		var left_side_foam = boat_foam.instantiate()
		left_side_foam.initialize(Vector3(global_position.x, .5, global_position.z), facing_direction)
		get_parent().add_child.call_deferred(left_side_foam)
		#
		var right_side_foam = boat_foam.instantiate()
		right_side_foam.initialize(Vector3(global_position.x, .5, global_position.z), mirror_vector(facing_direction))
		get_parent().add_child.call_deferred(right_side_foam)
		
		foam_cool_down = 0
		
func get_facing_direction_y_rotated_90():
	var y_rotation = rotation.y
	y_rotation += deg_to_rad(90)
	
	var direction = Vector3(sin(y_rotation), 0, cos(y_rotation))
	return direction.normalized()
	
func mirror_vector(original_vector: Vector3) -> Vector3:
	var mirrored_vector = original_vector
	mirrored_vector.x = -mirrored_vector.x  
	mirrored_vector.z = -mirrored_vector.z  
	
	return mirrored_vector
	
func shoot_cannon_ball(facing_direction):
	var cannon_ball = cannon_ball.instantiate()
	cannon_ball.initialize(Vector3(global_position.x, 2, global_position.z), facing_direction)
	get_parent().add_child.call_deferred(cannon_ball)

