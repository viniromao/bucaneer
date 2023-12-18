extends Node3D

var initial_speed = 10
var initial_y_speed = .01
var y_acceleration = -.0005
var initial_rotation 
var velocity
var waves = preload("res://elements/cannon_ball_wave.tscn")

func _ready():
	initial_rotation = 0

func _process(delta):
	move_in_direction(velocity, delta)
	initial_y_speed += y_acceleration
	global_position.y += initial_y_speed
	
	if global_position.y < 0: 
		var instance = waves.instantiate()
		instance.position = position
		get_parent().add_child(instance)
		queue_free()
	

func initialize(initial_position: Vector3, facing_direction: Vector3):
	self.set_position(initial_position)
	velocity = facing_direction	
	
func move_in_direction(direction: Vector3, delta):
	direction = direction.normalized()

	translate(direction * initial_speed * delta)
