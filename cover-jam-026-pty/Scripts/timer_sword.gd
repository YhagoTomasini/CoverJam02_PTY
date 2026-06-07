extends Timer

func _process(delta: float) -> void:
	wait_time = 1.2 / (1+Global.Multiple_CD)
