extends Node

# Multiplicadores de buffs
var Multiple_xp = 1.0
var Multiple_Damage = 1.0
var Multiple_Speed = 1.0
var Multiple_Health = 1.0
var Multiple_CD = 1.0
var Multiple_size = 1.0


var current_levelup = 10
var lv_atual = 0
var xp = 0

var enemys = []
var armas_atual = []

var player_morreu : bool = false

@onready var player = preload("res://Prefabs/Player.tscn")

func resetGame():
	Multiple_xp = 1.0
	Multiple_Damage = 1.0
	Multiple_Speed = 1.0
	Multiple_Health = 1.0
	Multiple_CD = 1.0
	Multiple_size = 1.0
	current_levelup = 10
	lv_atual = 0
	xp = 0
