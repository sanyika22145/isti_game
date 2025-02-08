extends Area2D
var rng = RandomNumberGenerator.new()
@onready var timer: Timer = $Timer
@onready var kurvaanyadat: AudioStreamPlayer = $kurvaanyadat
@onready var kurvaanyadat_2: AudioStreamPlayer = $kurvaanyadat2

func _on_body_entered(body: Node2D) -> void:
	
	var camera = get_tree().get_first_node_in_group("camera")
	if camera:
		camera.start_shake(50)
	var randomAudioSzam = rng.randi_range(1, 2)
	print(randomAudioSzam)
	if randomAudioSzam == 1:
		kurvaanyadat.play()
		await kurvaanyadat.finished
	elif randomAudioSzam == 2:
		kurvaanyadat_2.play()
		await kurvaanyadat_2.finished

	
	GameManager.score = 0
	
	timer.start()
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
