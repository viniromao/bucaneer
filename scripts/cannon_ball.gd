extends Node3D

var initial_speed = 0.1
var initial_y_speed = .2
var y_acceleration = -.001
var initial_rotation 

func _ready():
	initial_rotation = 0

func _process(delta):
	initial_y_speed += y_acceleration
	global_position.x = global_position.x + initial_speed
	global_position.y += initial_y_speed
	
	if global_position.y < 0: 
		print(global_position)
		queue_free()
	

func initialize(initial_position: Vector3, facing_direction: Vector3):
	self.set_position(initial_position)
	rotate_x(facing_direction.x)
	
