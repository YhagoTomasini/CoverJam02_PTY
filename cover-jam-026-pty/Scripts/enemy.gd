extends CharacterBody2D

@export var is_name = "Enemy"
@export var speed = 0.0
@export var health = 0
@export var damage = 00
@export var animation : AnimatedSprite2D

const XP = preload("res://Prefabs/xp.tscn")
const BLOOD = preload("res://Prefabs/sangue.tscn")

var player : CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	
func _physics_process(_delta: float) -> void:
	var direction := position.direction_to(player.position)
	velocity = direction * speed
	
	animation.play("Run")
	if velocity.x > 0:
		animation.flip_h = true
	else:
		animation.flip_h = false
	# print(position.direction_to(player.position))
	move_and_slide()

func receive_damage(damage_value: float):
	if health > damage_value:
		health -= damage_value
	else:
		var xp_drop = XP.instantiate()
		xp_drop.global_position = global_position
		call_deferred("add_sibling",xp_drop)
		deatch()

func slow():
	var speed_atual = speed
	speed /= 2
	await get_tree().create_timer(0.8).timeout
	speed = speed_atual

func deatch():
	var blood_instance = BLOOD.instantiate()
	get_tree().current_scene.add_child(blood_instance)
	blood_instance.global_position = global_position
	blood_instance.rotation = global_position.angle_to_point(-player.global_position)
	
	queue_free()
