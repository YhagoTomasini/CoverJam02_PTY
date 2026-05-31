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

var speed_icon = preload("res://Assets/flozinha.png")
var speed_text = "Speed"

var health_icon = preload("res://Assets/flozinha.png")
var health_text = "Health"

var xp_icon = preload("res://Assets/flozinha.png")
var xp_text = "Xp"

var dano_icon = preload("res://Assets/pistol.png")
var dano_text = "Dano"
	
var CD_icon = preload("res://Assets/bazuka.png")
var CD_text = "Cd"
	
var Size_icon = preload("res://Assets/faca.png")
var Size_text = "Size"


var speed = [speed_icon, speed_text,0.25]
var health = [health_icon, health_text,0.05]
var xp = [xp_icon, xp_text, 0.15]
var dano = [dano_icon,dano_text, 0.1]
var CD = [CD_icon, CD_text, 0.1]
var Size = [Size_icon, Size_text, 0.1]
var test = [0,0,0]

var arrayDeArmas =[speed,health,xp,dano,CD,size] 
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
	
	powerUp1 = arrayDeArmas.pick_random()
	powerUp2 = arrayDeArmas.pick_random()
	powerUp3 = arrayDeArmas.pick_random()

			
	match powerUp1:
		speed:
			text_1.text = speed[1]
			icon_1.texture = speed[0]
		health:
			text_1.text = health[1]
			icon_1.texture = health[0]
		xp:
			text_1.text = xp[1]
			icon_1.texture = xp[0]
		dano:
			text_1.text = dano[1]
			icon_1.texture = dano[0]
		CD:
			text_1.text = CD[1]
			icon_1.texture = CD[0]
		Size:
			text_1.text = Size[1]
			icon_1.texture = Size[0]
	match powerUp2:
		speed:
			text_2.text = speed[1]
			icon_2.texture = speed[0]
		health:
			text_2.text = health[1]
			icon_2.texture = health[0]
		xp:
			text_2.text = xp[1]
			icon_2.texture = xp[0]
		dano:
			text_2.text = dano[1]
			icon_2.texture = dano[0]
		CD:
			text_2.text = CD[1]
			icon_2.texture = CD[0]
		Size:
			text_2.text = Size[1]
			icon_2.texture = Size[0]
	match powerUp3:
		speed:
			text_3.text = speed[1]
			icon_3.texture = speed[0]
		health:
			text_3.text = health[1]
			icon_3.texture = health[0]
		xp:
			text_3.text = xp[1]
			icon_3.texture = xp[0]
		dano:
			text_3.text = dano[1]
			icon_3.texture = dano[0]
		CD:
			text_3.text = CD[1]
			icon_3.texture = CD[0]
		Size:
			text_3.text = Size[1]
			icon_3.texture = Size[0]

func _on_button_pressed() -> void:
	match powerUp1:
		speed:
			Global.Multiple_Speed += speed[2]
		health:
			Global.Multiple_Health += health[2]
		xp:
			Global.Multiple_xp += xp[2]
		dano:
			Global.Multiple_Damage += dano[2]
		CD:
			Global.Multiple_CD += CD[2]
		Size:
			Global.Multiple_Size += Size[2]
	visible = false


func _on_button_2_pressed() -> void:
	match powerUp2:
		speed:
			Global.Multiple_Speed += speed[2]
		health:
			Global.Multiple_Health += health[2]
		xp:
			Global.Multiple_xp += xp[2]
		dano:
			Global.Multiple_Damage += dano[2]
		CD:
			Global.Multiple_CD += CD[2]
		Size:
			Global.Multiple_Size += Size[2]
	visible = false


func _on_button_3_pressed() -> void:
	match powerUp3:
		speed:
			Global.Multiple_Speed += speed[2]
		health:
			Global.Multiple_Health += health[2]
		xp:
			Global.Multiple_xp += xp[2]
		dano:
			Global.Multiple_Damage += dano[2]
		CD:
			Global.Multiple_CD += CD[2]
		Size:
			Global.Multiple_Size += Size[2]
	visible = false
