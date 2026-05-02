extends CharacterBody2D

@export var speed = 20000.0
var mouse_pos = null
var in_area = false
var following = false
var can_move = true
enum class_types{
	CANON,
	BOW,
	DART
	
}
var tower_type ="CANON"
@onready var sprite_2d: Sprite2D = $Sprite2D


func _physics_process(delta: float) -> void:
	move_and_slide()
func _input(event: InputEvent) -> void:
	pass


func _on_pick_up_area_mouse_entered() -> void:
	in_area = true


func _on_pick_up_area_mouse_exited() -> void:
	in_area = false
