extends Node2D

@onready var player: CharacterBody2D = %Player
@onready var morte: Control = %Morte
const FLOWER = preload("uid://cvn3rdjlp7fhi")


func florecendo():
	var spawn_flor = FLOWER.instantiate()
	spawn_flor.position = Vector2(randi_range(-640,1280),randi_range(-480,960))
	add_sibling(spawn_flor)

func gameover():
	Global.player_morreu = true
	print("morreu")
	morte.visible = true
	get_tree().paused = true


func _on_spawner_de_flor_timeout() -> void:
	florecendo()
