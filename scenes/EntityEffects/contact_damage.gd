extends Node2D

var  recentlyDamaged:Array[Node2D]=[]
@export
var knockback:float = 10
@export
var damage:float = 10
@export
var cooldown:float = 1.0

signal attack

func _physics_process(_delta: float) -> void:
	var touches:Array[Node2D] =$Area2D.get_overlapping_bodies()
	for ob:Node2D in touches:
		DoContactDamage(ob)
		
func DoContactDamage(node:Node2D):
	if(not recentlyDamaged.has(node)):
		attack.emit()
		recentlyDamaged.append(node)
		get_tree().create_timer(cooldown).timeout.connect(func():recentlyDamaged.erase(node))
		if node.has_method("take_knockback"):
			var knockbackvector = (node.global_position-global_position ).normalized()*knockback
			node.take_knockback(knockbackvector)
		if node.has_method("take_damage"):
			node.take_damage(damage)
