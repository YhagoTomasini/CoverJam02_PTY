extends CharacterBody2D

var is_name = "Player"
@export var speed = 200.0 * Global.Multiple_Speed
var health = 100 * Global.Multiple_Health
var level = 0
var xp = 0

@onready var Pivot: Node2D = $Pivot
@onready var attack_Postion: Node2D = $Pivot/Marker2D
@export var attack_scene: PackedScene

@onready var timer : Timer = $Timer

@export var anim_body : AnimatedSprite2D
@export var anim_head : AnimatedSprite2D

func _ready() -> void:
	timer.wait_time = 1
	timer.one_shot = true
	timer.start()

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
		
		anim_body.play("Run")
		anim_head.play("Run")
		
		if velocity.x > 0:
			anim_body.flip_h = true
			anim_head.flip_h = true
			anim_head.position.x = 4
		elif velocity.x < 0:
			anim_body.flip_h = false
			anim_head.flip_h = false
			anim_head.position.x = -4
			
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
		
		anim_body.play("Idle")
		anim_head.play("Idle")
		
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		print("A")
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	if body.is_in_group("Enemy"):
		Damage(body.damage)

func _on_timer_timeout() -> void:
	var attack_instance = attack_scene.instantiate()
	attack_instance.global_position = attack_Postion.global_position
	attack_instance.global_rotation = Pivot.global_rotation
	get_parent().add_child(attack_instance)
	timer.start()
