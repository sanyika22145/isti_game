extends Sprite2D
@onready var nyertel: Label = $"../nyertel"
@onready var pickup: AudioStreamPlayer = $pickup


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		nyertel.text = "Nyertél!"
		pickup.play()
		visible = false
		$Area2D.collision_layer = 0
		$Area2D.collision_mask = 0
		await pickup.finished
		queue_free()
