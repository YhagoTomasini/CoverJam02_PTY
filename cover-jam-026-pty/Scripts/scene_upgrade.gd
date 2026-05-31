extends Control

@onready var button: Button = $Button
@onready var button_2: Button = $Button2
@onready var button_3: Button = $Button3


var macunaima_icon = preload("uid://cfpke015c26qd")
var macunaima_text = "Macunaima"

var mula_icon = preload("uid://cfpke015c26qd")
var mula_text = "Mula sem cabeça"

var corpo_icon = preload("uid://cfpke015c26qd")
var corpo_text = "Corpo seco"

var pistola_icon = preload("uid://cfpke015c26qd")
var pistola_text = "Pistola"
	
var bazuka_icon = preload("uid://cfpke015c26qd")
var bazuka_text = "Bazuka"
	
var faca_icon = preload("uid://cfpke015c26qd")
var faca_text = "Faca"


var macunaima = [macunaima_icon, macunaima_text,0.25]
var mula = [mula_icon, mula_text,0.05]
var corpo = [corpo_icon, corpo_text, 0.15]
var pistola = [pistola_icon,pistola_text, 0.1]
var bazuka = [bazuka_icon, bazuka_text, 0.1]
var faca = [faca_icon, faca_text, 0.1]

var arrayDeArmas =[faca,bazuka,pistola,corpo,mula,macunaima] 

var powerUp1 
var powerUp2
var powerUp3

var faca_ativa = false
var bazuka_ativa = false
var pistola_ativa = false
var corpo_ativa = false
var mula_ativa = false
var macunaima_ativa = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_page_down"):
		visible = false
	if Input.is_action_just_pressed("ui_page_up"):
		visible = true
		LeveUp()
		
		
func LeveUp():
	visible = true
	powerUp1 = arrayDeArmas.pick_random()
	powerUp2 = arrayDeArmas.pick_random()
	powerUp3 = arrayDeArmas.pick_random()
	if faca_ativa or bazuka_ativa or pistola_ativa or corpo_ativa or mula_ativa or macunaima_ativa:
		powerUp1 = arrayDeArmas.pick_random()
	if faca_ativa or bazuka_ativa or pistola_ativa or corpo_ativa or mula_ativa or macunaima_ativa:
		powerUp2 = arrayDeArmas.pick_random()
	if faca_ativa or bazuka_ativa or pistola_ativa or corpo_ativa or mula_ativa or macunaima_ativa:
		powerUp3 = arrayDeArmas.pick_random()

	match powerUp1:
		faca:
			button.text = faca[1]
			button.icon = faca[0]
		bazuka:
			button.text = bazuka[1]
			button.icon = bazuka[0]
		pistola:
			button.text = pistola[1]
			button.icon = pistola[0]
		corpo:
			button.text = corpo[1]
			button.icon = corpo[0]
		mula:
			button.text = mula[1]
			button.icon = mula[0]
		macunaima:
			button.text = macunaima[1]
			button.icon = macunaima[0]
	match powerUp2:
		faca:
			button_2.text = faca[1]
			button_2.icon = faca[0]
		bazuka:
			button_2.text = bazuka[1]
			button_2.icon = bazuka[0]
		pistola:
			button_2.text = pistola[1]
			button_2.icon = pistola[0]
		corpo:
			button_2.text = corpo[1]
			button_2.icon = corpo[0]
		mula:
			button_2.text = mula[1]
			button_2.icon = mula[0]
		macunaima:
			button_2.text = macunaima[1]
			button_2.icon = macunaima[0]
	match powerUp3:
		faca:
			button_3.text = faca[1]
			button_3.icon = faca[0]
		bazuka:
			button_3.text = bazuka[1]
			button_3.icon = bazuka[0]
		pistola:
			button_3.text = pistola[1]
			button_3.icon = pistola[0]
		corpo:
			button_3.text = corpo[1]
			button_3.icon = corpo[0]
		mula:
			button_3.text = mula[1]
			button_3.icon = mula[0]
		macunaima:
			button_3.text = macunaima[1]
			button_3.icon = macunaima[0]

func _on_button_pressed() -> void:
	match powerUp1:
		faca:
			faca_ativa = true
			print(faca)
		bazuka:
			pass
		pistola:
			pass
		corpo:
			pass
		mula:
			pass
		macunaima:
			pass
	visible = false


func _on_button_2_pressed() -> void:
	match powerUp2:
		faca:
			pass
		bazuka:
			pass
		pistola:
			pass
		corpo:
			pass
		mula:
			pass
		macunaima:
			pass
	visible = false


func _on_button_3_pressed() -> void:
	match powerUp3:
		faca:
			pass
		bazuka:
			pass
		pistola:
			pass
		corpo:
			pass
		mula:
			pass
		macunaima:
			pass
	visible = false
