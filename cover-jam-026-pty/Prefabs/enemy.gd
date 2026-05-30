extends CharacterBody2D

var is_name = "Enemy"
var speed = 200.0
var health = 10

func _physics_process(_delta: float) -> void:
	# Movimentação do jogador
	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")
	
	if direction_x or direction_y:
		velocity.x = direction_x * speed
		velocity.y = direction_y * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
