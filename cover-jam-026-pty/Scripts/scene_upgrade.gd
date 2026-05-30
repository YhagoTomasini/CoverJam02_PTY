extends Control

@onready var button: Button = $Button
@onready var button_2: Button = $Button2
@onready var button_3: Button = $Button3


var SPEED_icon = preload("uid://cfpke015c26qd")
var SPEED_text = "A Train:
	Aumenta 5% a velocidade do progenitor do caos"

var HP_icon = preload("uid://cfpke015c26qd")
var HP_text = "VIDA:
	Recupera 20% da vida
	Aumenta a vida maxima em 10%"

var XP_icon = preload("uid://cfpke015c26qd")
var XP_text = "Mais sangue:
Aumenta em 15% o ganho de sangue dos seus inimigos"

var DANO_icon = preload("uid://cfpke015c26qd")
var DANO_text = "O criador do caos:
	Aumenta o dano de todas as suas armas + 10%"
	
var CD_icon = preload("uid://cfpke015c26qd")
var CD_text = "MORRA MORRA MORA:
	Diminui o tempo de recarga das habilidades + 10%"
	
var SIZE_icon = preload("uid://cfpke015c26qd")
var SIZE_text = "Ninguem escapara:
	Aumenta o tamanho de seus projeteis + 10%"


var HP = [HP_icon, HP_text,0.25]
var SPEED = [SPEED_icon, SPEED_text,0.05]
var XP = [XP_icon, XP_text, 0.15]
var DANO = [DANO_icon,DANO_text, 0.1]
var CD = [CD_icon, CD_text, 0.1]
var SIZE = [SIZE_icon, SIZE_text, 0.1]

var arrayDePowerUps =[HP,SPEED,XP,DANO,CD,SIZE] 

var powerUp1 
var powerUp2
var powerUp3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_page_down"):
		visible = false
	if Input.is_action_just_pressed("ui_page_up"):
		visible = true
		LeveUp()
		
		
func LeveUp():
	visible = true
	powerUp1 = arrayDePowerUps.pick_random()
	powerUp2 = arrayDePowerUps.pick_random()
	powerUp3 = arrayDePowerUps.pick_random()
	match powerUp1:
		HP:
			button.text = HP[1]
			button.icon = HP[0]
		SPEED:
			button.text = SPEED[1]
			button.icon = SPEED[0]
		XP:
			button.text = XP[1]
			button.icon = XP[0]
		DANO:
			button.text = DANO[1]
			button.icon = DANO[0]
		CD:
			button.text = CD[1]
			button.icon = CD[0]
		SIZE:
			button.text = SIZE[1]
			button.icon = SIZE[0]
	match powerUp2:
		HP:
			button_2.text = HP[1]
			button_2.icon = HP[0]
		SPEED:
			button_2.text = SPEED[1]
			button_2.icon = SPEED[0]
		XP:
			button_2.text = XP[1]
			button_2.icon = XP[0]
		DANO:
			button_2.text = DANO[1]
			button_2.icon = DANO[0]
		CD:
			button_2.text = CD[1]
			button_2.icon = CD[0]
		SIZE:
			button_2.text = SIZE[1]
			button_2.icon = SIZE[0]
	match powerUp3:
		HP:
			button_3.text = HP[1]
			button_3.icon = HP[0]
		SPEED:
			button_3.text = SPEED[1]
			button_3.icon = SPEED[0]
		XP:
			button_3.text = XP[1]
			button_3.icon = XP[0]
		DANO:
			button_3.text = DANO[1]
			button_3.icon = DANO[0]
		CD:
			button_3.text = CD[1]
			button_3.icon = CD[0]
		SIZE:
			button_3.text = SIZE[1]
			button_3.icon = SIZE[0]

func _on_button_pressed() -> void:
	match powerUp1:
		HP:
			Global.Multiple_Health += HP[2]
		SPEED:
			Global.Multiple_Speed += SPEED[2]
		XP:
			Global.Multiple_xp += XP[2]
		DANO:
			Global.Multiple_Damage += DANO[2]
		CD:
			Global.Multiple_CD += DANO[2]
		SIZE:
			Global.Multiple_size += DANO[2]
	visible = false


func _on_button_2_pressed() -> void:
	match powerUp2:
		HP:
			Global.Multiple_Health += HP[2]
		SPEED:
			Global.Multiple_Speed += SPEED[2]
		XP:
			Global.Multiple_xp += XP[2]
		DANO:
			Global.Multiple_Damage += DANO[2]
		CD:
			Global.Multiple_CD += DANO[2]
		SIZE:
			Global.Multiple_size += DANO[2]
	visible = false


func _on_button_3_pressed() -> void:
	match powerUp3:
		HP:
			Global.Multiple_Health += HP[2]
		SPEED:
			Global.Multiple_Speed += SPEED[2]
		XP:
			Global.Multiple_xp += XP[2]
		DANO:
			Global.Multiple_Damage += DANO[2]
		CD:
			Global.Multiple_CD += DANO[2]
		SIZE:
			Global.Multiple_size += DANO[2]
	visible = false
