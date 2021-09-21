extends Control

var naves = []

func _ready() -> void:
	
	for nave in get_children():
		if nave is Ship:
			naves.append(nave)
	
	_on_Scale_value_changed($ControlPanel/Scale.value)
	_on_Speed_value_changed($ControlPanel/Speed.value)

func _on_Scale_value_changed(value: float) -> void:
	for nave in naves:
		nave.movement_scale = value
		nave.trail.clear_points()
		nave.t = 0.0

func _on_Speed_value_changed(value: float) -> void:
	for nave in naves:
		nave.speed = value
		nave.trail.clear_points()
		nave.t = 0.0
