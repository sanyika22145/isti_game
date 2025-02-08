extends Node

var score = 0

func _process(delta: float) -> void:
	$"Scoreboard/Score".text = str(score)
