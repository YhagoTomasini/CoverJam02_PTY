extends Area2D

var cooldown = 1 * Global.Multiple_CD
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position
	await get_tree().create_timer(0.2).timeout
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		body.receive_damage(10)
