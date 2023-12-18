extends Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var random_number = randi() % 8 + 1
	var random_number_float = randf_range(1, 6) 
	
	wait_time = random_number_float

