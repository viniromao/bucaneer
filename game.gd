extends Node3D

var pirate_frames = load("res://elements/pirate_frames.tscn")
var pirate_frames_enum = load("res://scripts/pirate_portrait_enum.gd")

func _ready():
	var instance = pirate_frames.instantiate()
	instance.set_pirate_portrait(pirate_frames_enum.pirate_portrait.PIRATE_1)
	instance.set_pirate_portrait(pirate_frames_enum.pirate_portrait.PIRATE_2)
	instance.set_pirate_portrait(pirate_frames_enum.pirate_portrait.PIRATE_3)
	add_child(instance)

func _process(delta):
	pass
