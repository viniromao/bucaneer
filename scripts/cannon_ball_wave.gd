extends Node3D

var wave = preload("res://elements/wave.tscn")

var radius = .01
var object_count = 20

func _ready():
	for i in range(object_count):
		var angle = 2 * PI * i / object_count
		var x = radius * cos(angle)
		var z = radius * sin(angle)

		var instance = wave.instantiate()
		instance.position = Vector3(x, 0, z)
		instance.set_direction((instance.position - Vector3(0, 0, 0)).normalized())
		add_child(instance)
