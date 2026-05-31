extends Control

@export var scroll : ScrollContainer
@export var text : RichTextLabel
@export var velo : float = 1.0
@export var pause : Control

var acabou : bool = false
var acelerando : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	acelerando = false
	acabou = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func fim():
	acabou = true
	pause.pausar()

func _physics_process(delta: float) -> void:
	if acabou:
		return
		
	if Input.is_action_pressed("ui_accept"):
		if !acelerando:
			acelerando = true
		velo = 6.0
	else:
		if acelerando:
			acelerando = false
		velo = 1.0
		
	if scroll.scroll_vertical <= text.size.y + 100:
		scroll.scroll_vertical += velo
	
	else:
		fim()
