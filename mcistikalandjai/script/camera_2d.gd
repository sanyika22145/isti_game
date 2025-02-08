extends Camera2D

var shake_amount = 0.0
var shake_decay = 3.0

func _process(delta):
	offset = Vector2(randf_range(-shake_amount, shake_amount), randf_range(-shake_amount, shake_amount))
	shake_amount = lerp(shake_amount, 0.0, shake_decay * delta)

func start_shake(amount: float):
	shake_amount = amount
