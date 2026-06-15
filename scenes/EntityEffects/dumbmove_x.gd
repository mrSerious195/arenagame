extends Node2D
@export
var SPEED:float
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

func _physics_process(delta: float) -> void:
	var playerdif = player.global_position.x-parent.global_position.x
	if(abs(playerdif)>10):
		parent.velocity.x=sign(player.global_position.x-parent.global_position.x)*SPEED
	else:
		parent.velocity.x*=0.60
	parent.move_and_slide()
