extends Node
class_name game_over_scene
var wave:int
signal newgame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/VBoxContainer/Label2.text="you got to wave "+str(wave)


func startnewgame() -> void:
	newgame.emit()
