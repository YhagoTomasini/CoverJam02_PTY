extends CharacterBody2D

var is_name = "Player"
@export var speed = 200.0
var health = 100
var level = 0
var xp = 0

@onready var Pivot: Node2D = $Pivot
@onready var attack_Postion: Node2D = $Pivot/Marker2D
@export var attack: PackedScene

func Check_xp():
	if xp >= Global.current_levelup:
		Global.current_levelup = Global.current_levelup * 2.10
		print("Level UP")
		
func Damage(damage_value: float):
	if (health >= damage_value):
		health -= damage_value
		print("Voce tomou: ",damage_value," dano")
	else:
		Global.Deatch()

func _physics_process(_delta: float) -> void:
	# Movimentação do jogador
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction:
		velocity = direction * speed
		Pivot.rotation = direction.angle()
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		var attack_instance = attack.instantiate()
		attack_instance.global_position = attack_Postion.global_position
		attack_instance.global_rotation = Pivot.global_rotation
		get_parent().add_child(attack_instance)
		pass
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		Damage(body.damage)
