extends Node2D
@export
var rangeVisualLiser:Range
@export 
var cooldown:float
@export
var bombScene:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rangeVisualLiser.max_value=cooldown
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rangeVisualLiser.value=$Timer.time_left
	if Input.is_action_just_pressed("drop_bomb") and $Timer.time_left<=0:
		$Timer.start(cooldown)
		var bomb = bombScene.instantiate()
		bomb.global_position=global_position
		get_tree().root.add_child(bomb)
	pass
