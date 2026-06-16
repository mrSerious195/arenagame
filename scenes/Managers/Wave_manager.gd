extends Node
@export
var creatureManager:CreatureManager
@export
var wave:int=0
@export
var Waves:Array[Wave]
signal wave_changed(newstage:int)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_wave()


func _populate_wave()->void:
	var children =get_children()
	var cappedstage:int = min(wave,Waves.size())-1
	for i in children.size():
		if Waves[cappedstage].enemiesAtLocation.size()>i and Waves[cappedstage].enemiesAtLocation[i] != null:
			var creature = Waves[cappedstage].enemiesAtLocation[i].instantiate()
			children[i].spawn_creature(creature,3,creatureManager)
	
func next_wave()->void:
	wave+=1
	wave_changed.emit(wave)
	_populate_wave()
