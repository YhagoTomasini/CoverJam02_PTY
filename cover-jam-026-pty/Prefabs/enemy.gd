extends CharacterBody2D

var is_name = "Enemy"
var speed = 200.0
var health = 10

@onready var player = %Player

func _physics_process(_delta: float) -> void:
	# Movimentação do jogador
	print(position.direction_to(player.position))
	var direction_x := position.direction_to(player.position).x
	var direction_y := position.direction_to(player.position).y
	
	if direction_x or direction_y:
		velocity.x = direction_x * speed
		velocity.y = direction_y * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
