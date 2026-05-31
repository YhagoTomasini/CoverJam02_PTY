extends CharacterBody2D

@export var is_name = "Enemy"
@export var speed = 100.0
@export var health = 10
@export var damage = 10

var player : CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	
func _physics_process(_delta: float) -> void:
	var direction := position.direction_to(player.position)
	velocity = direction * speed
	# print(position.direction_to(player.position))

	move_and_slide()
