extends Area2D
var rng = RandomNumberGenerator.new()
@onready var timer: Timer = $Timer
@onready var kurvaanyadat: AudioStreamPlayer = $kurvaanyadat
@onready var kurvaanyadat_2: AudioStreamPlayer = $kurvaanyadat2
@onready var betyar: AudioStreamPlayer = $betyar
@onready var nehogy: AudioStreamPlayer = $nehogy

func _on_body_entered(body: Node2D) -> void:
	body.get_node("CollisionShape2D").queue_free()
	var camera = get_tree().get_first_node_in_group("camera")
	if camera:
		camera.start_shake(50)
	var randomAudioSzam = rng.randi_range(1, 8)
	print(randomAudioSzam)
	if randomAudioSzam == 1 or randomAudioSzam == 2 or randomAudioSzam == 3:
		kurvaanyadat.play()
		await kurvaanyadat.finished
	elif randomAudioSzam == 4 or randomAudioSzam == 5:
		kurvaanyadat_2.play()
		await kurvaanyadat_2.finished
	elif randomAudioSzam == 6 or randomAudioSzam == 7:
		nehogy.play()
		await nehogy.finished
	elif randomAudioSzam == 8:
		betyar.play()
		await betyar.finished
	
	GameManager.score = 0
	
	timer.start()
func _on_timer_timeout() -> void:
	
	get_tree().reload_current_scene()
