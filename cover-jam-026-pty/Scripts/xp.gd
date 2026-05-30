extends Area2D

func _ready() -> void:
	var _xp = 10;

func _on_body_entered(body: Node2D) -> void:
	if (body.is_name == "Player"):
		body.xp = body.xp + 10
		body.check_xp()
		queue_free()
	pass # Replace with function body.
