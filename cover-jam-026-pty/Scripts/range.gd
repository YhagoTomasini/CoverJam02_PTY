extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position
	await get_tree().create_timer(0.2).timeout
	queue_free()

func create():
	pass
