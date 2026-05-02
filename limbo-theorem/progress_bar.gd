extends ProgressBar

@onready var spawner = get_node("../../Path2D")

func _ready() -> void:
	min_value = 0
	max_value = spawner.max_enemy

func _process(delta: float) -> void:
	value = clamp(spawner.get_enemy_count(), 0, max_value)
