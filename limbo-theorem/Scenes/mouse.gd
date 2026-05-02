extends Node2D

var holding:CharacterBody2D
var mouse_pos = null
var in_area = false
var following = false
@export var speed = 200.0
var velocity:Vector2= Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_pos = get_viewport().get_mouse_position()
	global_position = mouse_pos
	
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and in_area:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				following = true
	if event is InputEventMouseButton and event.is_released() and following:
		following = false
		velocity=Vector2(0,0)
