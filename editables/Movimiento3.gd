extends Control

var naves = []

func _ready() -> void:
	
	naves.append($Nave1)
	naves.append($Nave2)
	naves.append($Nave3)
	
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
