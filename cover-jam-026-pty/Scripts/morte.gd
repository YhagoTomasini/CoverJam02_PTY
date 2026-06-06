extends Control

@export var botao : Button


func gameover():
	Global.player_morreu = true
	visible = true
	get_tree().paused = true
	
	botao.grab_focus()
	
func _on_btn_again_pressed() -> void:
	Global.player_morreu = false
	Global.resetGame()
	get_tree().paused = false
	get_tree().reload_current_scene()
	

func _on_btn_menu_pressed() -> void:
	Global.player_morreu = false
	Global.resetGame()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	
