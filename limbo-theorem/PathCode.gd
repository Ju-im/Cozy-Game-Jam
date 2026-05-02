extends PathFollow2D

@onready var enemy = $RigidBody2D

@export var runspeed: float = 550.0

func _process(delta: float) -> void:
	progress += runspeed * delta

	# no invalid function calls here

	if progress_ratio >= 1.0:
		queue_free()
