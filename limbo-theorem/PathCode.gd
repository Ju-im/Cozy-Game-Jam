extends PathFollow2D

@export var runspeed: float = 200.0

func _process(delta: float) -> void:
	progress += runspeed * delta
	
	if not loop and progress_ratio >= 1.0:
		queue_free()
