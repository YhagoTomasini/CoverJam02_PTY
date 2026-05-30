extends Area2D

var xp = 10
var is_name = "xp"

func _on_body_entered(body: Node2D) -> void:
	print("s")
	if (body.is_name == "Player"):
		body.xp = body.xp + 10
		body.check_xp()
		queue_free()
