extends Node2D

var rotate : float = 0
var cooldown : float = 0.6
@onready var timer : Timer = $Timer
@onready var pivotSpaw : Node2D = $"."
@onready var markerAttack : Marker2D = $MarkerSpawn
@export var enemy : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	spawn()
	timer.start()
	pass # Replace with function body.

func spawn():
	var enemy_instance = enemy.instantiate()
	pivotSpaw.global_rotation = randf_range(0,360)
	enemy_instance.global_position = markerAttack.global_position
	get_parent().get_parent().add_child(enemy_instance)
	pass
