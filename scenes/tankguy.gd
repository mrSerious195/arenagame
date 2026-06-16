extends Node2D

var default_x:float

var previousPosition:Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	previousPosition=global_position
	default_x=position.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var delta_pos = previousPosition-global_position
	if abs(delta_pos.y)>0.5:
		if delta_pos.y>0:
			$Tankguy.position.y=2
		else:
			$Tankguy.position.y=-1
	else:
		$Tankguy.position.y=0 

	if abs(delta_pos.x)>0.5:
		if (delta_pos.x>0):
			$Tankguy.rotation=PI/8
		else:
			$Tankguy.rotation=-PI/8
	else:
		$Tankguy.rotation=0 
	if $"../Tonk".flip_h:
		position.x=-default_x
	else:
		position.x=default_x
	
	previousPosition=global_position
