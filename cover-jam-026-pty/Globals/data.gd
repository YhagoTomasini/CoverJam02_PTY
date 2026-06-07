extends Control
@export var vida : Label
@export var vidaMax : Label
@export var danoF : Label
@export var danoP : Label
@export var alcance : Label
@export var cd : Label
@export var multiXp : Label

@export var speed = 150.0 * Global.Multiple_Speed
@export var max_health = 100
@export var health = max_health * Global.Multiple_Health
func _process(_float):
	vida.text = "Vida do player:" + str(health)
	vidaMax.text = "Vida maxima:" + str(max_health)
	danoF.text = "Dano faca:" + str(10* Global.Multiple_Damage)
	danoP.text = "Dano pistola:" + str(5 * Global.Multiple_Damage)
	alcance.text = "Alcance do ataque:" + str( Global.Multiple_size)
	cd.text = "Cooldown dos ataques:" + str(Global.Multiple_CD)
	multiXp.text = "valoror de xp:" + str(10 + Global.Multiple_xp)
