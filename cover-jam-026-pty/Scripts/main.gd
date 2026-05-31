extends Node2D

@onready var player: CharacterBody2D = %Player
@onready var morte: Control = $CanvasLayer/Morte

var player_morreu : bool

func gameover():
	player_morreu = true
	print("morreu")
	morte.visible = true
	get_tree().paused = true
