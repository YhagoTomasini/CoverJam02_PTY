extends CharacterBody2D

var is_name = "Player"
var speed = 200.0
var health = 100
var level = 0
var xp = 0

func check_xp():
	if xp >= Global.current_levelup:
		Global.current_levelup = Global.current_levelup * 2.10
		print("Level UP")

func _physics_process(_delta: float) -> void:
	# Movimentação do jogador
	var direction := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction or direction_y:
		velocity.x = direction * speed
		velocity.y = direction_y * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
