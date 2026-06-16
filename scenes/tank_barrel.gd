extends Node2D
@export
var minrotation:float = -3*PI/8
var maxrotation:float = PI/8

@export 
var BulletScene:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_animate()
	_handle_shooting()


func _animate()->void:
	var mousedirection:Vector2=get_global_mouse_position()-global_position
	rotation =_limited_Berrel_Movement(mousedirection, mousedirection.x<0)

func _limited_Berrel_Movement(mousedirection:Vector2, isMirrored:bool)->float:
	if mousedirection.x==0:
		mousedirection.x-=0.1
	var rot:float =atan(mousedirection.y/mousedirection.x)
	if isMirrored:
		rot +=PI
		rot= max(min(rot,PI-minrotation),PI-maxrotation)
	else:
		rot= min(max(rot,minrotation),maxrotation)
	
	return rot

func _handle_shooting()-> void:
	if(Input.is_action_just_pressed("fireGun")):
		print("fire")
		var bullet:Bullet = BulletScene.instantiate()
		bullet.currentTarget=bullet.Target.ENEMY
		bullet.bulletDirection=Vector2(1,tan(rotation)).normalized()
		if rotation>PI/2:
			bullet.bulletDirection*=-1
		bullet.global_position=global_position
		get_tree().root.add_child(bullet)
