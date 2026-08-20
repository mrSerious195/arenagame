extends Node2D
@export
var SPEED:float
var ACCELERATION:float =100
var DECELERATION:float = 100
var player:Player
var parent:CharacterBody2D
@export 
var body: Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent=get_parent()
	var players =  get_tree().get_nodes_in_group("players")
	if(players.size()>0 and players[0] is Player):
		player=players[0]
	else:
		print("player not found")

func _physics_process(_delta: float) -> void:
	var playerdifx = player.global_position.x-parent.global_position.x
	var playerdirx=sign(playerdifx)
	if(abs(playerdifx)>10):
			parent.velocity.x = move_toward(parent.velocity.x,playerdirx* SPEED, ACCELERATION)
	else:
			parent.velocity.x = move_toward(parent.velocity.x, 0, DECELERATION)
			
	var playerdify = player.global_position.y-parent.global_position.y
	var playerdiry=sign(playerdify)
	if(abs(playerdify)>10):
			parent.velocity.y = move_toward(parent.velocity.y,playerdiry* SPEED, ACCELERATION)
	else:
			parent.velocity.y = move_toward(parent.velocity.y, 0, DECELERATION)
	parent.move_and_slide()
