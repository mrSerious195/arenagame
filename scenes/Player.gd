extends CharacterBody2D
class_name Player
@export 
var SPEED:float = 300.0
@export 
var ACCELERATION:float = 50.0
@export 
var DECELERATION:float = 50.0
@export 
var AIR_CONTROLX:float = .25
@export 
var JUMP_VELOCITY:float = 600.0
@export 
var JUMP_CUTOFF:float = .5 
@export 
var MAX_HEALTH:float = 100.0
var health:float = MAX_HEALTH
@export 
var BulletScene:PackedScene

signal health_changed(health:float,max_health:float)

func _ready() -> void:
	add_to_group("players")

func _physics_process(delta: float) -> void:
	_handleYMovement(delta)
	_handleXMovement()
	_handle_shooting()
	move_and_slide() 

func _handleYMovement(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("up") and (is_on_floor()):
		velocity.y = -JUMP_VELOCITY
	if Input.is_action_just_released("up") and velocity.y<0:
		velocity.y*=JUMP_CUTOFF       

func _handleXMovement() -> void:
	var direction := Input.get_axis("left", "right")
	if direction:
		if(is_on_floor()):
			velocity.x = move_toward(velocity.x,direction* SPEED, ACCELERATION)
		else:
			velocity.x = move_toward(velocity.x,direction* SPEED, ACCELERATION*AIR_CONTROLX)
	else:
		if(is_on_floor()):
			velocity.x = move_toward(velocity.x, 0, DECELERATION)
		else:
			velocity.x = move_toward(velocity.x, 0, DECELERATION*AIR_CONTROLX)
			
func _handle_shooting()-> void:
	if(Input.is_action_just_pressed("fireGun")):
		var bullet:Bullet = BulletScene.instantiate()
		bullet.currentTarget=bullet.Target.ENEMY
		bullet.bulletDirection=(get_global_mouse_position()-global_position).normalized()
		bullet.global_position=global_position
		get_parent().add_child(bullet)

func take_damage(damage:float)-> void:
	health-=damage
	health_changed.emit(health,MAX_HEALTH)
	if(health<0):
		print("rip")
		
func take_knockback(knockback:float, pucher:Node2D)-> void:
	print("knocked back")
	velocity+= (global_position-pucher.global_position ).normalized()*knockback
	
