extends Node
@export
var creatures:Array[PackedScene] =[]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var children =get_children()
	var newcreature = creatures[0].instantiate()
	children[0].spawn_creature(newcreature,3,$"../CreatureManager")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
