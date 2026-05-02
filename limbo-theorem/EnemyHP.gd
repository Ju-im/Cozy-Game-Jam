extends Node2D

const MAX_HEALTH := 5
var health := MAX_HEALTH

@onready var health_bar = $HealthBar



func _ready() -> void:
	update_health_ui()
	health_bar.max_value = MAX_HEALTH
	health = MAX_HEALTH


func update_health_ui() -> void:
	health_bar.value = health


func _DmgSystem():
	pass

func damage() -> void:
	health -= 1
	update_health_ui()

	if health <= 0:
		die()


func die() -> void:
	print("dead")
	queue_free()
