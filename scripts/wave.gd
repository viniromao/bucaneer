extends Node3D


var direction = Vector3.ZERO
var move_speed = 1.0

func _process(delta):
	position += direction * move_speed * delta
	
func set_direction(position_given):
	direction = position_given
	
func _on_timer_timeout():
	queue_free() # Replace with function body.
