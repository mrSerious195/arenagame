extends Node2D
@export
var SPEED:float
var ACCELERATION:float =100
var DECELERATION:float = 100
var AIR_CONTROLX:float=0.2
var player:Player
var parent:CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent=get_parent()
	var players =  get_tree().get_nodes_in_group("players")
	if(players.size()>0 and players[0] is Player):
		player=players[0]
	else:
		print("player not found")

func _physics_process(_delta: float) -> void:
	var playerdif = player.global_position.x-parent.global_position.x
	var playerdir=sign(playerdif)
	if(abs(playerdif)>10):
		if(parent.is_on_floor()):
			parent.velocity.x = move_toward(parent.velocity.x,playerdir* SPEED, ACCELERATION)
		else:
			parent.velocity.x = move_toward(parent.velocity.x,playerdir* SPEED, ACCELERATION*AIR_CONTROLX)
	else:
		if(parent.is_on_floor()):
			parent.velocity.x = move_toward(parent.velocity.x, 0, DECELERATION)
		else:
			parent.velocity.x = move_toward(parent.velocity.x, 0, DECELERATION*AIR_CONTROLX)
	parent.move_and_slide()
