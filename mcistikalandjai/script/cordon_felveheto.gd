extends Sprite2D
@onready var pickup: AudioStreamPlayer = $pickup


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('player'):
		GameManager.score += 100
		print(GameManager.score)
		pickup.play()
		visible = false
		body.set_collision_layer_value(1, false) 
		body.set_collision_layer_value(10, true)
		await pickup.finished
		queue_free()
