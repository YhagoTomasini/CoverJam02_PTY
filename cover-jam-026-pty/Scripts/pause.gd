extends Control

@export var voltarB : Button

var parado : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	parado = false

func despausa():
	get_tree().paused = false

	visible = false
	parado = false

func pausar():
	if !parado:
		visible = true
		get_tree().paused = true
		
		#await get_tree().process_frame
		#voltarB.grab_focus()
		parado = true
		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_pause"):
		if !parado:
			pausar()
		else:
			despausa()
	
	if not get_viewport().gui_get_focus_owner():
				voltarB.grab_focus()	


func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/pause.tscn")


func _on_resetar_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_voltar_pressed() -> void:
	despausa()
