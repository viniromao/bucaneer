extends Node3D
var number_of_objects = 50

var explosion_fragment = load("res://elements/explosiont_fragment.tscn")

func hit_explosion(position: Vector3):
	for i in range(number_of_objects):
		# Instance the object
		var instance = explosion_fragment.instantiate()
		instance.set_position_fragment(position)
		add_child(instance)


