extends CharacterBody2D

var is_name = "Player"
@export var speed = 150.0
@export var max_health = 100 
@export var health = 100


var level = 0


@onready var Pivot: Node2D = $PivotAttack
@onready var attack_Postion: Node2D = $PivotAttack/MarkerAttack
@export var attack_sword: PackedScene
@export var attack_pistol: PackedScene

@onready var timer_sword : Timer = $Timer_sword
@onready var timer_fire : Timer = $Timer_fire
@onready var timer_spawn : Timer = $PivotSpawn/Timer
@onready var timer_wave : Timer = $"../Timer_wave"

@export var anim_body : AnimatedSprite2D
@export var anim_head : AnimatedSprite2D

@onready var lv_up_arma: Control = $"../CanvasLayer/lv_up_arma"
@onready var lv_up_buff: Control = $"../CanvasLayer/lv_up_buff"
@onready var main: Node2D = $".."
@onready var health_bar: ProgressBar = $"../HUD/health_bar"



func _ready() -> void:
	#timer_sword.start()
	#imer_fire.start()
	pass

func set_Health(health_value):
	if health + health_value > (max_health * Global.Multiple_Health):
		health = max_health * Global.Multiple_Health
	else:
		health += health_value
	print(health)
	
	Global.vida_atual = health
	
func equipar_arma(arma):
	if arma == "pistola":
		timer_fire.start()
	if arma == "faca":
		timer_sword.start()

func check_xp():
	if Global.xp >= Global.current_levelup:
		Global.current_levelup = Global.current_levelup * 1.15
		Global.lv_atual += 1
		Global.xp = 0
		if Global.lv_atual == 1:
			timer_spawn.start()
			timer_wave.start()
			lv_up_arma.LeveUp()
		elif Global.lv_atual == 5:
			lv_up_arma.LeveUp()
		else:
			lv_up_buff.LeveUp()
		print("Level UP:", Global.lv_atual)
		
func receive_damage(damage_value: float):
	if (health > damage_value):
		health -= damage_value
	else:
		main.gameover()
		
func Damage(damage_value: float):
	if (health >= damage_value):
		health -= damage_value
		
		Global.vida_atual = health
		print("Voce tomou: ",damage_value," dano")
	else:
		main.gameover()
	
func _physics_process(_delta: float) -> void:
	health_bar.value = health
	health_bar.max_value = max_health * Global.Multiple_Health
	# Movimentação do jogador
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction:
		velocity = direction * (speed * Global.Multiple_Speed)
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
	if body.is_in_group("Xp"):
		print("XP")

func _on_timer_sword_timeout() -> void:
	var attack_instance = attack_sword.instantiate()
	attack_instance.global_position = attack_Postion.global_position
	attack_instance.global_rotation = Pivot.global_rotation
	get_parent().add_child(attack_instance)
	timer_sword.start()

func _on_timer_fire_timeout() -> void:
	if Global.enemys:
		var attack_instance = attack_pistol.instantiate()
		attack_instance.global_position = attack_Postion.global_position
		attack_instance.global_rotation = Pivot.global_rotation
		get_parent().add_child(attack_instance)
		timer_fire.start()


func _on_timer_wave_timeout() -> void:
	if (timer_spawn.wait_time >= 0.2):
		timer_spawn.wait_time = timer_spawn.wait_time - 0.2
