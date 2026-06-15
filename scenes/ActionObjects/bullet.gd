extends MeshInstance2D
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
	get_tree().create_timer(MaxTime).timeout.connect(queue_free)
	if bulletDirection.x>0:
		rotation =atan(bulletDirection.y/bulletDirection.x)
	else:
		rotation =PI+ atan(bulletDirection.y/bulletDirection.x)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += bulletDirection * bulletVelocity * delta
	


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
				node.take_knockback(knockback, self)
		if node.has_method("take_damage"):
				node.take_damage(damage)
	if(shouldBulletDisapear):
		queue_free()
