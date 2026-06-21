extends Node
class_name  game_scene
signal gameOver(level:int)


func _on_player_died() -> void:
	gameOver.emit($WaveManager.wave)
