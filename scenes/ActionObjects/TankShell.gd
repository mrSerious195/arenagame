extends RigidBody2D
class_name Bullet
@export
var MaxTime:float=10
@export
var bulletVelocity:float
@export
var knockback:float
@export
var damage:float
enum Target {NONE=0,ENEMY=1, PLAYER=2, All=3}
var currentTarget:int

var bulletDirection:Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("shell spawned at position"+str(global_position))
	get_tree().create_timer(MaxTime).timeout.connect(queue_free)
	if bulletDirection.x>0:
		rotation =atan(bulletDirection.y/bulletDirection.x)
	else:
		rotation =PI+ atan(bulletDirection.y/bulletDirection.x)
		
	linear_velocity+= bulletDirection * bulletVelocity
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	linear_velocity += get_gravity() * delta
	_animate_rotation()
	

func _animate_rotation()->void:
	if linear_velocity.x>0:
		rotation =atan(linear_velocity.y/linear_velocity.x)
	else:
		rotation =PI+ atan(linear_velocity.y/linear_velocity.x)
		
func on_hit(node:Node2D)->void:
	var shouldBulletDisapear:bool =true
	var shouldDamage:bool = false
	
	match currentTarget:
		1:
			if node.is_in_group("enemies"):
				shouldDamage=true
			elif node.is_in_group("players"):
				shouldBulletDisapear=false
		2:
			if node.is_in_group("players"):
				shouldDamage=true
			elif node.is_in_group("enemies"):
				shouldBulletDisapear=false
		3:
			shouldDamage=true
			
	if(shouldDamage):
		if node.has_method("take_knockback"):
				node.take_knockback(knockback*linear_velocity)
		if node.has_method("take_damage"):
				node.take_damage(damage)
	if(shouldBulletDisapear):
		queue_free()
