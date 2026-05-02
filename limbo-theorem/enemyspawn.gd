extends Path2D

var timer := 0.0

@export var spawnTime := 1.5
@export var max_enemy := 20
@export var wave_delay := 5.0

var wave := 0
var spawning := false
var wave_timer := 5.0
var wave_complete := false
var enemy_killed=0
var follower = preload("res://basicEnemy.tscn")

func _process(delta: float) -> void:
	if wave_complete:
		return  # ⛔ HARD STOP — nothing happens anymore

	if spawning:
		timer += delta

		if timer >= spawnTime:
			if get_child_count() < max_enemy:
				var enemy = follower.instantiate()
				add_child(enemy)
				timer = 0.0
				enemy_killed+=1

			# 👇 END WAVE CONDITION
		if enemy_killed >= max_enemy:
			end_wave()

	else:
		wave_timer -= delta

		if wave_timer <= 0:
			start_wave()


func start_wave() -> void:
	wave += 1
	spawning = true
	wave_complete = false
	wave_timer = wave_delay
	timer = 0.0


func end_wave() -> void:
	spawning = false
	wave_complete = true
	
	
func _input(event):
	if event.is_action_pressed("ui_accept"): # space by default
		if not spawning:
			start_wave()


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func DamageSystem(body: Node2D) -> void:
	get_tree().get_nodes_in_group("DamageSystem")
	body.damage()
	print("helo")
