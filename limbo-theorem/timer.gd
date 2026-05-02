extends Label

@onready var spawner: Path2D = $"../.."


func _process(delta: float) -> void:
	if spawner.spawning:
		text = "Wave " + str(spawner.wave) + " active"
	else:
		text = "Next wave in: " + str(int(spawner.wave_timer))
