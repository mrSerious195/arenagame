extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var touches = get_overlapping_bodies()
	for t in touches:
		if t.has_method("take_damage"):
			t.take_damage(9999999999)
