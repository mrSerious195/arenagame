extends Node
@export
var gamescene:PackedScene
@export
var gameOverscene:PackedScene
# Called when the node enters the scene tree for the first time.
func startGame()->void:
	clearscene()
	var newScene:game_scene = gamescene.instantiate()
	newScene.gameOver.connect(SetgameOver)
	add_child(newScene)

func SetgameOver(wave:int)->void:
	clearscene()
	var newScene:game_over_scene = gameOverscene.instantiate()
	newScene.wave=wave
	newScene.newgame.connect(startGame)
	add_child(newScene)
	
func clearscene()->void:
	var children = get_children()
	for c in children:
		c.queue_free()
