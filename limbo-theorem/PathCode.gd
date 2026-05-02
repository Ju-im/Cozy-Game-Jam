extends PathFollow2D
@onready var rigid_body_2d: CharacterBody2D = $RigidBody2D

@export var runspeed: float = 150.0

func _process(delta: float) -> void:
	progress += runspeed * delta
	rigid_body_2d.set_health_bar()
	
	if not loop and progress_ratio >= 1.0:
		queue_free()
