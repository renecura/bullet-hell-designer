extends Control

onready var nave = $Nave

func _ready() -> void:
	$ControlPanel/Scale.value = nave.movement_scale
	$ControlPanel/Speed.value = nave.speed

func _on_Scale_value_changed(value: float) -> void:
	nave.movement_scale = value
	nave.trail.clear_points()
	nave.t = 0.0

func _on_Speed_value_changed(value: float) -> void:
	nave.speed = value
	nave.trail.clear_points()
	nave.t = 0.0
