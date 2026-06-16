extends CharacterBody2D
@export
var health = 50


func _ready() -> void:
	add_to_group("enemies")

func _physics_process(delta: float) -> void:
	if(not is_on_floor()):
		velocity += get_gravity() * delta
 
func take_damage(damage:float)-> void:
	health-=damage
	if(health<0):
		queue_free()
		
func take_knockback(knockback:Vector2)-> void:
	velocity+= knockback
