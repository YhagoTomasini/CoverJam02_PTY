extends Area2D

var cooldown = 1 * Global.Multiple_CD
var Multiple_size = 1 * Global.Multiple_size
var direction
var speed = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale = Vector2(Multiple_size,Multiple_size)
	if (Global.enemys):
		direction = position.direction_to(Global.enemys[0])
	else:
		direction = Vector2(1,0)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		body.receive_damage(5)
		queue_free()
	if body.is_in_group("Wall"):
		queue_free()

func _process(delta: float) -> void:
	position += direction * speed
