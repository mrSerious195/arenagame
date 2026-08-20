extends Node2D
@export
var minrotation:float = -3*PI/8
var player:Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var players =  get_tree().get_nodes_in_group("players")
	if(players.size()>0 and players[0] is Player):
		player=players[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var playerdirection:Vector2=player.global_position-global_position
	rotation =_limited_Weapon_Movement(playerdirection, playerdirection.x<0)

func _limited_Weapon_Movement(mousedirection:Vector2, isMirrored:bool)->float:
	if mousedirection.x==0:
		mousedirection.x-=0.1
	var rot:float =atan(mousedirection.y/mousedirection.x)
	if isMirrored:
		rot +=PI
		rot= min(rot,PI-minrotation)
	else:
		rot= max(rot,minrotation)
	
	return rot
