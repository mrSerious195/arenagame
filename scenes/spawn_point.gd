extends Marker2D

func spawn_creature(node:Node2D,delay_in_seconds:float,creatureManager:Node)->void:
	visible=true
	get_tree().create_timer(delay_in_seconds).timeout.connect(_finalize_spawn.bind(node,creatureManager))

func _finalize_spawn(node:Node2D,creatureManager:Node)->void:
	visible=false
	node.global_position=global_position
	creatureManager.add_child(node)
