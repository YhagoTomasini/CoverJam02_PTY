extends ProgressBar

@onready var lv_txt: Label = $lv_txt


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	max_value = Global.current_levelup
	value = Global.xp
	lv_txt.text = str("LV " , Global.lv_atual)
