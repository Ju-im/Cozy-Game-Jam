extends Path2D

var timer := 0.0

@export var spawnTime := 1.5
@export var max_enemy := 20
@export var wave_delay := 5.0

var wave := 0
var spawning := false
var wave_timer := 5.0
var wave_complete := false

var follower = preload("res://basicEnemy.tscn")

func _ready() -> void:
	# 🧹 REMOVE ANY PRE-EXISTING ENEMIES UNDER THIS NODE
	for child in get_children():
		child.queue_free()

func _process(delta: float) -> void:
	if wave_complete:
		return

	if spawning:
		timer += delta

		if timer >= spawnTime:
			var enemy = follower.instantiate()
			add_child(enemy)
			timer = 0.0

		# wave ends when limit reached
		if get_enemy_count() >= max_enemy:
			end_wave()

	else:
		wave_timer -= delta

		if wave_timer <= 0:
			start_wave()


# 📊 SAFE enemy count (group-based, not children)
func get_enemy_count() -> int:
	return get_tree().get_nodes_in_group("enemies").size()


func start_wave() -> void:
	wave += 1
	spawning = true
	wave_complete = false
	wave_timer = wave_delay
	timer = 0.0

func _input(event):
	if event.is_action_pressed("ui_accept"): # space by default
		if not spawning:
			start_wave()

func end_wave() -> void:
	spawning = false
	wave_complete = true
	
