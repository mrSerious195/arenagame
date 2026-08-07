extends RigidBody2D
@export
var fuse:float
@export
var damage:float
@export
var knockback:float

var explosionsize:Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	explosionsize=$Explosion.scale
	$Explosion.scale=Vector2.ZERO
	$Explosion.visible=false
	get_tree().create_timer(fuse).timeout.connect(explode)


# Called every frame. 'delta' is the elapsed time sincewa the previous frame.
func _process(delta: float) -> void:
	pass

func explode()->void:
	$Explosion.visible=true
	$Bomb.visible=false
	$CollisionShape2D.visible=false
	freeze=true
	var tw:Tween =get_tree().create_tween()
	tw.tween_property($Explosion,"scale",explosionsize,0.2)
	tw.tween_callback(Do_Damage)
	tw.chain().tween_property($Explosion,"modulate", Color.TRANSPARENT, 1.0)
	tw.finished.connect(queue_free)
	
func Do_Damage()->void:
	for entity:Node2D in $Explosion/Area2D.get_overlapping_bodies():
		var posdiff = entity.position-position
		if entity.has_method("take_knockback"):
				entity.take_knockback(knockback*posdiff)
		if entity.has_method("take_damage"):
				entity.take_damage(damage)
