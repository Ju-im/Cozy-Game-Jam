extends ProgressBar

@onready var enemy = get_parent()

func _ready() -> void:
	min_value = 0
	max_value = enemy.max_health
	value = max_value  # 🔥 starts FULL

	# optional: makes it look smoother
	show_percentage = false


func _process(delta: float) -> void:
	if enemy == null:
		return

	value = enemy.health
