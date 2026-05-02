extends Node2D
@export var mouse:Node2D
var in_area=false
enum class_types{
	CANON,
	BOW,
	DART
}

func _ready() -> void:
	pass
	
func  _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_released() and in_area:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				if(mouse.heldObject!= null):
					mouse.heldObject.can_move = false
					mouse.heldObject.global_position = self.global_position
					mouse.heldObject = null
					


func _on_area_2d_area_entered(area: Area2D) -> void:
	in_area = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	in_area = false
