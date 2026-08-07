extends Node2D

@export
var bombScene:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("drop_bomb"):
		var bomb = bombScene.instantiate()
		bomb.global_position=global_position
		get_tree().root.add_child(bomb)
	pass
