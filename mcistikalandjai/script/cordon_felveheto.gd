extends Sprite2D
@onready var pickup: AudioStreamPlayer = $pickup
@onready var area_2d: Area2D = $Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('player'):
		GameManager.score += 3
		pickup.play()
		visible = false
		$Area2D.collision_layer = 0
		$Area2D.collision_mask = 0
		await pickup.finished
		queue_free()
