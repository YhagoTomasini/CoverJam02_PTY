extends Control
@export var vida : Label
@export var vidaMax : Label
@export var velo : Label
@export var danoF : Label
@export var danoP : Label
@export var alcance : Label
@export var cd : Label
@export var multiXp : Label

func _process(_float):
	vida.text = "Vida do player:" + str(Global.vida_atual)
	vidaMax.text = "Vida maxima:" + str(100 * Global.Multiple_Health)
	velo.text = "Velocidade do player" + str(150.0 * Global.Multiple_Speed)
	danoF.text = "Dano faca:" + str(10* Global.Multiple_Damage)
	danoP.text = "Dano pistola:" + str(5 * Global.Multiple_Damage)
	alcance.text = "Alcance do ataque:" + str( Global.Multiple_size)
	cd.text = "Cooldown dos ataques:" + str(Global.Multiple_CD)
	multiXp.text = "valoror de xp:" + str(10 + Global.Multiple_xp)
