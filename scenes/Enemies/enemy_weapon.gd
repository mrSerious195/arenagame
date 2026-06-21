extends Node2D

var defaultpos:Vector2
var actionAdjustmentX:float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	defaultpos=$Fist.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../Tonk".flip_h:
		$Fist.position.x= -defaultpos.x-actionAdjustmentX
	else:
		$Fist.position.x= defaultpos.x	+actionAdjustmentX
	$Fist.flip_h=$"../Tonk".flip_h

func attack()->void:
	actionAdjustmentX=5
	var tween = get_tree().create_tween()
	tween.tween_property(self,"actionAdjustmentX",0,0.5)
