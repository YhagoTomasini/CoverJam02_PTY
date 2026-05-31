extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.xp += 1
		body.check_xp()
		body.set_Health(10)
		queue_free()
