extends CharacterBody2D
@export
var health = 50

func _ready() -> void:
	add_to_group("enemies")


 
func take_damage(damage:float)-> void:
	print("enemy damaged")
	health-=damage
	if(health<=0):
		queue_free()
		
func take_knockback(knockback:Vector2)-> void:
	velocity+= knockback
