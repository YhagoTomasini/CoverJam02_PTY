extends CharacterBody2D

var is_name = "Player"
var speed = 200.0
var health = 100
var level = 0
var xp = 0

var range = preload("res://range.tscn").instantiate()

func Check_xp():
	if xp >= Global.current_levelup:
		Global.current_levelup = Global.current_levelup * 2.10
		print("Level UP")
		
func Damage(damage_value: float):
	if (health >= damage_value):
		health -= damage_value
	else:
		Global.Deatch()
	print("Voce tomou: ",damage_value," dano")

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
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		add_child(range)
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_name == "Enemy":
		Damage(body.damage)
