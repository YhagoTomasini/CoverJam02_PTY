extends Control

@export var button: Button
@export var button_2: Button
@export var button_3: Button

@export var icon_1: TextureRect
@export var icon_2: TextureRect
@export var icon_3: TextureRect

@export var text_1: Label
@export var text_2: Label
@export var text_3: Label

var mapinguari_icon = preload("res://Assets/flozinha.png")
var mapinguari_text = "mapinguari"

var mula_icon = preload("res://Assets/flozinha.png")
var mula_text = "Mula sem cabeça"

var corpo_icon = preload("res://Assets/flozinha.png")
var corpo_text = "Corpo seco"

var pistola_icon = preload("res://Assets/pistol.png")
var pistola_text = "Pistola"
	
var bazuka_icon = preload("res://Assets/bazuka.png")
var bazuka_text = "Bazuka"
	
var faca_icon = preload("res://Assets/faca.png")
var faca_text = "Faca"


var mapinguari = [mapinguari_icon, mapinguari_text,0.25]
var mula = [mula_icon, mula_text,0.05]
var corpo = [corpo_icon, corpo_text, 0.15]
var pistola = [pistola_icon,pistola_text, 0.1]
var bazuka = [bazuka_icon, bazuka_text, 0.1]
var faca = [faca_icon, faca_text, 0.1]
var test = [0,0,0]

var arrayDeArmas =[faca,bazuka,pistola,corpo,mula,mapinguari] 
var arrayColetadas =[test]

var powerUp1 
var powerUp2
var powerUp3


func _ready() -> void:
	button.grab_focus()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_page_down"):
		visible = false
	if Input.is_action_just_pressed("ui_page_up"):
		LeveUp()
		
		
func LeveUp():
	visible = true
	get_tree().paused = true
	powerUp1 = arrayDeArmas.pick_random()
	powerUp2 = arrayDeArmas.pick_random()
	powerUp3 = arrayDeArmas.pick_random()
	
	for i in arrayColetadas:
		while powerUp1 == i:
			powerUp1 = arrayDeArmas.pick_random()
		while powerUp2 == i:
			powerUp2 = arrayDeArmas.pick_random()
		while powerUp3 == i:
			powerUp3 = arrayDeArmas.pick_random()
			
	match powerUp1:
		faca:
			text_1.text = faca[1]
			icon_1.texture = faca[0]
		bazuka:
			text_1.text = bazuka[1]
			icon_1.texture = bazuka[0]
		pistola:
			text_1.text = pistola[1]
			icon_1.texture = pistola[0]
		corpo:
			text_1.text = corpo[1]
			icon_1.texture = corpo[0]
		mula:
			text_1.text = mula[1]
			icon_1.texture = mula[0]
		mapinguari:
			text_1.text = mapinguari[1]
			icon_1.texture = mapinguari[0]
	match powerUp2:
		faca:
			text_2.text = faca[1]
			icon_2.texture = faca[0]
		bazuka:
			text_2.text = bazuka[1]
			icon_2.texture = bazuka[0]
		pistola:
			text_2.text = pistola[1]
			icon_2.texture = pistola[0]
		corpo:
			text_2.text = corpo[1]
			icon_2.texture = corpo[0]
		mula:
			text_2.text = mula[1]
			icon_2.texture = mula[0]
		mapinguari:
			text_2.text = mapinguari[1]
			icon_2.texture = mapinguari[0]
	match powerUp3:
		faca:
			text_3.text = faca[1]
			icon_3.texture = faca[0]
		bazuka:
			text_3.text = bazuka[1]
			icon_3.texture = bazuka[0]
		pistola:
			text_3.text = pistola[1]
			icon_3.texture = pistola[0]
		corpo:
			text_3.text = corpo[1]
			icon_3.texture = corpo[0]
		mula:
			text_3.text = mula[1]
			icon_3.texture = mula[0]
		mapinguari:
			text_3.text = mapinguari[1]
			icon_3.texture = mapinguari[0]

func _on_button_pressed() -> void:
	match powerUp1:
		faca:
			#adicionar funcao
			arrayColetadas.append(faca)
			Global.armas_atual.append(faca)
		bazuka:
			#adicionar funcao
			arrayColetadas.append(bazuka)
		pistola:
			#adicionar funcao
			arrayColetadas.append(pistola)
		corpo:
			#adicionar funcao
			arrayColetadas.append(corpo)
		mula:
			#adicionar funcao
			arrayColetadas.append(mula)
		mapinguari:
			#adicionar funcao
			arrayColetadas.append(mapinguari)
	visible = false
	get_tree().paused = false


func _on_button_2_pressed() -> void:
	match powerUp2:
		faca:
			#adicionar funcao
			arrayColetadas.append(faca)
		bazuka:
			#adicionar funcao
			arrayColetadas.append(bazuka)
		pistola:
			#adicionar funcao
			arrayColetadas.append(pistola)
		corpo:
			#adicionar funcao
			arrayColetadas.append(corpo)
		mula:
			#adicionar funcao
			arrayColetadas.append(mula)
		mapinguari:
			#adicionar funcao
			arrayColetadas.append(mapinguari)
	visible = false
	get_tree().paused = false


func _on_button_3_pressed() -> void:
	match powerUp3:
		faca:
			#adicionar funcao
			arrayColetadas.append(faca)
		bazuka:
			#adicionar funcao
			arrayColetadas.append(bazuka)
		pistola:
			#adicionar funcao
			arrayColetadas.append(pistola)
		corpo:
			#adicionar funcao
			arrayColetadas.append(corpo)
		mula:
			#adicionar funcao
			arrayColetadas.append(mula)
		mapinguari:
			#adicionar funcao
			arrayColetadas.append(mapinguari)
	visible = false
	get_tree().paused = false
