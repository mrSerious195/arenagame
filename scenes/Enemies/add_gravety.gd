extends Node2D

var parent:PhysicsBody2D
func _ready() -> void:
	parent=get_parent()
	parent.move_and_slide()
	
func _physics_process(delta: float) -> void:
	
	if(not parent.is_on_floor()):
		parent.velocity += parent.get_gravity() * delta
