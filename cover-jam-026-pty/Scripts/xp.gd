extends Area2D

var xp = 10 + Global.Multiple_xp
var is_name = "xp"
@onready var collision: CollisionShape2D = $collision

func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	collision.disabled = false

func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("Player")):
		Global.xp += xp
		body.check_xp()
		queue_free()
	pass
