extends Control

@export var botao : Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	botao.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
