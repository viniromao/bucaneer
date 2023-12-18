extends "res://scripts/boat.gd"

func _on_area_entered(area):
	var collision_position = (global_transform.origin + area.global_transform.origin) * 0.5
	area.queue_free()
	cannon_ball_hit(collision_position)
