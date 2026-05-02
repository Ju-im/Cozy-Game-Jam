extends Node2D
var heldObject:CharacterBody2D
var mouse_pos = null
var in_area = false
var following = false
@export var speed = 200.0
var velocity:Vector2= Vector2.ZERO


func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	follow(delta)
	mouse_pos = get_viewport().get_mouse_position()
	global_position = mouse_pos
	
	
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and in_area:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				following = true
	if event is InputEventMouseButton and event.is_released() and following:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
			
				following = false
				
		#holding.velocity=Vector2(0,0)
		

func follow(delta:float):
	
	if following and heldObject !=null and heldObject.can_move:
		heldObject.global_position = global_position
		

		
func _on_area_2d_area_entered(area: Area2D) -> void:
	in_area= true
	
	
	if area.get_parent() is CharacterBody2D:
		heldObject=area.get_parent()
		if !heldObject.can_move:
			heldObject=null


func _on_area_2d_area_exited(area: Area2D) -> void:
	in_area = false
