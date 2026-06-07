class_name Enemy
extends CharacterBody2D

@export var speed : float
@export var max_health : int
@export var damage : int

@export var animation : AnimatedSprite2D
var player : CharacterBody2D
@export var attack : bool
@export var cooldownAttack : float

var health : int

const XP = preload("res://Prefabs/xp.tscn")

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	attack = true
	health = max_health
	
func _physics_process(delta: float) -> void:
	move()
	move_and_slide()
	collider()

func collider():
	for i in range(get_slide_collision_count()):
		var colission = get_slide_collision(i)
		if colission != null:
			var collider = colission.get_collider()
			if collider.is_in_group("Player"):
				if attack == true:
					attack = false
					collider.receive_damage(damage);
					slow();
					await get_tree().create_timer(cooldownAttack).timeout
					attack = true
					
func move():
	var direction := position.direction_to(player.position)
	velocity = direction * speed
	
	animation.play("Run")
	if velocity.x > 0:
		animation.flip_h = true
	else:
		animation.flip_h = false
	
func receive_damage(damage_value: float):
	if health > damage_value:
		health -= damage_value
	else:
		deatch()

func slow():
	var speed_atual = speed
	speed /= 2
	await get_tree().create_timer(cooldownAttack).timeout
	speed = speed_atual

func drop():
	var xp_drop = XP.instantiate()
	xp_drop.global_position = global_position
	call_deferred("add_sibling",xp_drop)

func deatch():
	drop()
	queue_free()
