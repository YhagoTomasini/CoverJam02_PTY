extends Node2D

@onready var collision : CollisionShape2D = $Range_fire/CollisionShape2D

func _on_range_fire_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		Global.enemys.append(body.position)

func _on_range_fire_body_exited(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		Global.enemys.pop_at(Global.enemys.find(body))
	
func _on_timer_timeout() -> void:
	collision.disabled = true
	collision.disabled = false
	pass # Replace with function body.
