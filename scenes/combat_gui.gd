extends Control
@export
var player:Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ProgressBar.max_value=player.MAX_HEALTH
	$ProgressBar.value=player.MAX_HEALTH
	player.health_changed.connect(player_health_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func player_health_changed(health:float,max_health:float)->void:
	$ProgressBar.max_value=max_health
	$ProgressBar.value=health

func wave_changed(newstage:int)->void:
	$VBoxContainer/StageLabel.text=str(newstage)
