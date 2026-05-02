extends CharacterBody2D

@export var speed = 20000.0
var mouse_pos = null
var in_area = false
var following = false

@onready var sprite_2d: Sprite2D = $Sprite2D


func _physics_process(delta: float) -> void:
	follow(delta)
	move_and_slide()
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and in_area:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				following = true
	if event is InputEventMouseButton and event.is_released() and following:
		following = false
		velocity=Vector2(0,0)
			
	

func follow(delta:float):
	
	if following:
		mouse_pos = get_viewport().get_mouse_position()
		var distance = global_position.distance_to(mouse_pos)
		if distance > 5:
			var direction = global_position.direction_to(mouse_pos)
			velocity = direction  * speed* delta
		else:
			velocity= Vector2.ZERO

		
			
		
		
	
		
		
	


func _on_pick_up_area_mouse_entered() -> void:
	print("Mouse in area")
	in_area = true


func _on_pick_up_area_mouse_exited() -> void:
	in_area = false
