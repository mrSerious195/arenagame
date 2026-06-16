extends Node
class_name CreatureManager
signal wave_ended

func check_if_wave_ended(_just_died:Node)->void:
	var children =get_children()
	if children.size()==1:
		wave_ended.emit()
